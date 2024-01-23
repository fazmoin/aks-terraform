variable "client_id" {
    type    = string
    default = "some-client-id"
}

variable "client_secret" {
    type    = string
    default = "some-client-secret"
}

variable "resource_group_name" {
    type    = string
    default = "networking-resource-group"
}

variable "location" {
    type    = string
    default = "UK South"
}

variable "vnet_address_space" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

variable "cluster_name" {
    type    = string
    default = "terraform-aks-cluster"
}

variable "dns_prefix" {
    type    = string
    default = "myaks-project"
}

variable "kubernetes_version" {
    type    = string
    default = "1.26.6"
}

variable "service_principal_client_id" {
    type = string
}

variable "service_principal_secret" {
    type = string
}

variable "vnet_id" {
    type = string
}

variable "control_plane_subnet_id" {
    type = string
}

variable "worker_node_subnet_id" {
    type = string
}

variable "aks_nsg_id" {
    type = string
}
