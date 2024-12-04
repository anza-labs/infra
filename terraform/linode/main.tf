provider "linode" {}

module "lke" {
  source = "./modules/lke"
  root   = abspath(path.module)

  cluster_name = "7S23SK"
  k8s_version  = "latest"

  flux            = false
  github_repo     = "https://github.com/anza-labs/manifests"
  github_token    = var.github_token
  bitwarden_token = var.bitwarden_token
}

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
