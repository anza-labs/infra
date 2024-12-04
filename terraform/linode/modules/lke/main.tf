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

  pool {
    type  = "g6-standard-2"
    count = 3
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
  for_each   = var.flux ? [1] : []
  depends_on = [linode_lke_cluster.lke]

  path = "clusters/${var.cluster_name}"
}

provider "kubernetes" {
  host                   = local.host
  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
  token                  = local.token
}

resource "kubernetes_secret" "bitwarden" {
  depends_on = [linode_lke_cluster.lke]
  for_each   = var.flux ? [1] : []

  metadata {
    name      = "bitwarden"
    namespace = "kube-system"
  }

  data = {
    token = var.bitwarden_token
  }
}

data "kubernetes_nodes" "nodes" {}
