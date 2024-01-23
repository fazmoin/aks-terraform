provider "azurerm" {
    version         = "=3.0.0"

    subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = "some-tenant-id"
    features {}
}

module "networking" {
    source = "./networking-module"

    resource_group_name = var.resource_group_name
    location            = var.location
    vnet_address_space  = var.vnet_address_space
}

module "aks_cluster" {
    source = "./aks-cluster-module"

    aks_cluster_name                = "aks-cluster"
    cluster_location                = var.location
    dns_prefix                      = var.dns_prefix
    kubernetes_version              = "1.18.14"
    service_principal_client_id     = var.service_principal_client_id
    service_principal_secret        = var.service_principal_secret
    vnet_id                         = var.vnet_id
    control_plane_subnet_id         = var.control_plane_subnet_id
    worker_node_subnet_id           = var.worker_node_subnet_id
    networking_resource_group_name  = var.resource_group_name

    depends_on = [ module.networking ]
}