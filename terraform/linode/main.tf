module "lke" {
  source       = "./modules/lke"
  cluster_name = "7S23SK"
  kubeconfig   = var.kubeconfig
}
