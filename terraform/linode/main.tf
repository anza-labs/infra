provider "linode" {}

module "eu-1" {
  source = "./modules/lke"
  root   = abspath(path.module)

  cluster_name = "eu-1"
  k8s_version  = "latest"

  flux            = true
  github_repo     = "https://github.com/anza-labs/manifests"
  github_token    = var.github_token
  bitwarden_token = var.bitwarden_token
}
