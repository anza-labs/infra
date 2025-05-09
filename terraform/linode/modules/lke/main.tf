data "linode_lke_versions" "lke" {}

locals {
  versions       = sort([for version in data.linode_lke_versions.lke.versions : version.id])
  latest_version = element(local.versions, length(local.versions) - 1)
}

resource "linode_lke_cluster" "lke" {
  k8s_version = var.k8s_version == "latest" ? local.latest_version : var.k8s_version
  label       = var.cluster_name
  region      = var.region

  tags = [
    "prod",
  ]

  dynamic "pool" {
    for_each = var.node_pools
    content {
      type  = pool.value.type
      count = pool.value.count
    }
  }
}

locals {
  kubeconfig = yamldecode(base64decode(linode_lke_cluster.lke.kubeconfig))
}

locals {
  cluster = local.kubeconfig.clusters[0].cluster
  user    = local.kubeconfig.users[0].user

  host                   = local.cluster.server
  cluster_ca_certificate = local.cluster["certificate-authority-data"]
  token                  = local.user["token"]

  flux_path = var.cluster_mode == "infra" ? "clusters/${var.cluster_name}-infra" : "clusters/${var.infra_cluster}-infra/${var.cluster_name}"
}

provider "flux" {
  kubernetes = {
    host                   = local.host
    cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
    token                  = local.token
  }
  git = {
    url = var.github_repo
    http = {
      username = "any"
      password = var.github_token
    }
  }
}

resource "flux_bootstrap_git" "flux" {
  depends_on = [linode_lke_cluster.lke]
  count      = var.flux ? 1 : 0

  path = local.flux_path
}

provider "kubernetes" {
  host                   = local.host
  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
  token                  = local.token
}

resource "kubernetes_secret" "bitwarden" {
  depends_on = [linode_lke_cluster.lke]
  count      = var.flux ? 1 : 0

  metadata {
    name      = "bitwarden"
    namespace = "kube-system"
  }

  data = {
    token = var.bitwarden_token
  }
}

resource "kubernetes_secret" "discord_webhook" {
  depends_on = [linode_lke_cluster.lke, flux_bootstrap_git.flux]
  count      = var.flux ? 1 : 0

  metadata {
    name      = "discord-webhook"
    namespace = "flux-system"
  }

  data = {
    address = var.discord_webhook
  }
}

data "kubernetes_nodes" "nodes" {
  depends_on = [linode_lke_cluster.lke]
}

resource "bitwarden_secret" "kubeconfig" {
  key        = "${var.cluster_name} (${var.cluster_mode}) Kubeconfig"
  value      = base64decode(linode_lke_cluster.lke.kubeconfig)
  project_id = var.project_id
  note       = "Kubeconfig for ${var.cluster_name} (${var.cluster_mode})"
}
