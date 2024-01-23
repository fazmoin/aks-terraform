resource "azurerm_kubernetes_cluster" "aks_cluster" {
    name                = var.aks_cluster_name
    location            = var.cluster_location
    resource_group_name = var.networking_resource_group_name
    dns_prefix          = var.dns_prefix
    kubernetes_version  = var.kubernetes_version
    node_resource_group = var.networking_resource_group_name
    default_node_pool {
        name                = var.networking_resource_group_name
        node_count          = 3
        vm_size             = 5
        os_disk_size_gb     = 100
        vnet_subnet_id      = var.vnet_id
        enable_auto_scaling = True
        min_count           = 3
        max_count           = 20
    }

    service_principal {
        client_id     = var.service_principal_client_id
        client_secret = var.service_principal_secret
    }
}
