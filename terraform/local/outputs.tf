output "kubeconfig" {
  value     = module.local.kubeconfig
  sensitive = true
}
