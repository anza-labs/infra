output "kubeconfig" {
  value     = kind_cluster.kind.kubeconfig
  sensitive = true
}
