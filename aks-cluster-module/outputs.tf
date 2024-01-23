output "aks_cluster_name" {
    value = module.aks_cluster.aks_cluster_name
}

output "aks_cluster_id" {
    value = module.aks_cluster.aks_cluster_id
}

output "aks_kubeconfig" {
    value = module.aks_cluster.aks_kubeconfig
}
