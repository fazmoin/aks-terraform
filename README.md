# Terraform Modules for Azure

This repository contains Terraform modules for creating networking and AKS cluster resources in Azure.

## Structure

The repository is divided into two main modules:

1. **networking-module**: This module is responsible for creating networking resources in Azure like Virtual Network, Subnets, etc. The main resources are created in `main.tf` and the variables are defined in `variables.tf`. The outputs are defined in `outputs.tf`.

2. **aks-cluster-module**: This module is responsible for creating an Azure Kubernetes Service (AKS) cluster. The main resources are created in `main.tf` and the variables are defined in `variables.tf`. The outputs are defined in `outputs.tf`.

## Usage

To use these modules, you need to call them in your main Terraform configuration file and provide the required input variables.

Here is an example of how to use the `networking-module`:

```hcl
module "networking" {
  source = "./networking-module"
  resource_group_name = "myResourceGroup"
  location            = "westus"
  vnet_address_space  = ["10.0.0.0/16"]
}
```
And here is an example of how to use the `aks-cluster-module`:

```
module "aks_cluster" {
  source = "./aks-cluster-module"
  aks_cluster_name = "myAKSCluster"
  cluster_location = "westus"
  dns_prefix = "mydns"
  kubernetes_version = "1.18.14"
  service_principal_client_id = "<service_principal_client_id>"
  service_principal_secret = "<service_principal_secret>"
  vnet_id = module.networking.vnet_id
  control_plane_subnet_id = module.networking.control_plane_subnet_id
  worker_node_subnet_id = module.networking.worker_node_subnet_id
  networking_resource_group_name = module.networking.networking_resource_group_name
}
```
Please replace `<service_principal_client_id>` and `<service_principal_secret> `with your actual service principal's client ID and secret.

## Outputs
After running the Terraform scripts, you can get the output values using the following commands:
```
terraform output vnet_id
terraform output control_plane_subnet_id
terraform output worker_node_subnet_id
terraform output networking_resource_group_name
terraform output aks_cluster_name
terraform output aks_cluster_id
terraform output aks_kubeconfig
```
These outputs can be used in other Terraform scripts or for configuring your Kubernetes client.

Please replace the placeholders and example values with the actual values that suit your project.