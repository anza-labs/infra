provider "linode" {}

module "lke" {
  source = "./modules/lke"
  root   = abspath(path.module)

  cluster_name = "7S23SK"
  k8s_version  = "latest"

  kubeconfig = var.kubeconfig
}
