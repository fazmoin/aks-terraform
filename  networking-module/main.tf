resource "azurerm_resource_group" "aks_rg" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_virtual_network" "aks_vnet" {
    name                = "aks-vnet"
    address_space       = var.vnet_address_space
    location            = azurerm_resource_group.aks_rg.location
    resource_group_name = azurerm_resource_group.aks_rg.name
}

resource "azurerm_subnet" "control_plane_subnet" {
    name                 = "control-plane-subnet"
    resource_group_name  = azurerm_resource_group.aks_rg.name
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "worker_node_subnet" {
    name                 = "worker-node-subnet"
    resource_group_name  = azurerm_resource_group.aks_rg.name
    virtual_network_name = azurerm_virtual_network.aks_vnet.name
    address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_security_group" "aks_nsg" {
    name                = "aks-nsg"
    location            = azurerm_resource_group.aks_rg.location
    resource_group_name = azurerm_resource_group.aks_rg.name
}

resource "azurerm_network_security_rule" "kube_apiserver_rule" {
    name                        = "kube-apiserver-rule"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "6443"
    source_address_prefixes      = ["YOUR_PUBLIC_IP_ADDRESS"]
    destination_address_prefix  = azurerm_subnet.control_plane_subnet.address_prefixes[0]
    resource_group_name         = azurerm_resource_group.aks_rg.name
    network_security_group_name = azurerm_network_security_group.aks_nsg.name
}

resource "azurerm_network_security_rule" "ssh_rule" {
    name                        = "ssh-rule"
    priority                    = 200
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefixes      = ["YOUR_PUBLIC_IP_ADDRESS"]
    destination_address_prefix  = azurerm_subnet.control_plane_subnet.address_prefixes[0]
    resource_group_name         = azurerm_resource_group.aks_rg.name
    network_security_group_name = azurerm_network_security_group.aks_nsg.name
}
