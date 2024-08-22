module "lke" {
  source       = "./modules/lke"
  cluster_name = "7S23SK"
  k8s_version  = "1.30"
  kubeconfig   = var.kubeconfig
}
