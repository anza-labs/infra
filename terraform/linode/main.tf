provider "linode" {}

provider "bitwarden" {
  access_token = var.bws_access_token
  experimental {
    embedded_client = true
  }
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
  discord_webhook = var.discord_webhook
}

module "zot-registry" {
  source = "./modules/storage"
  root   = abspath(path.module)

  name        = "zot-registry"
  project_id  = "2728ee07-5f6d-4c5c-97d8-b1c500b28bb9"
}
