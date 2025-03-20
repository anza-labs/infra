provider "kind" {}

module "local" {
  source = "./modules/local"
  root   = abspath(path.module)


  cluster_name = "local"

  # renovate: datasource=docker depName=kindest/node
  k8s_version  = "v1.32.3"

  flux            = true
  github_repo     = "https://github.com/anza-labs/manifests"
  github_token    = var.github_token
  bitwarden_token = var.bitwarden_token
  discord_webhook = var.discord_webhook
}
