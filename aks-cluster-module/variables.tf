variable "aks_cluster_name" {
    description = "Name of the AKS cluster"
    type        = string
}

variable "cluster_location" {
    description = "Azure region where the AKS cluster will be deployed"
    type        = string
    default     = "uksouth"
}

variable "dns_prefix" {
    description = "DNS prefix of the cluster"
    type        = string
}

variable "kubernetes_version" {
    description = "Kubernetes version for the cluster"
    type        = string
}

variable "service_principal_client_id" {
    description = "Client ID for the service principal associated with the cluster"
    type        = string
}

variable "service_principal_secret" {
    description = "Client Secret for the service principal"
    type        = string
}

variable "vnet_id" {
    description = "ID of the VNet where the cluster will be deployed"
    type        = string
    default = azurerm_virtual_network.vnet.id
}

variable "control_plane_subnet_id" {
    description = "ID of the subnet where the control plane will be deployed"
    type       = string
    default =  azurerm_subnet.control_plane_subnet.id
}

variable "worker_node_subnet_id" {
    description = "ID of the subnet where the worker nodes will be deployed"
    type        = string
    default =  azurerm_subnet.worker_node_subnet.id
}

variable "networking_resource_group_name" {
    description = "Name of the resource group where the networking resources are deployed"
    type        = string
    default = azurerm_resource_group.networking_rg.name
}

