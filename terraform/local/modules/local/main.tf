provider "docker" {
  host = var.docker_socket
}

resource "docker_network" "kind" {
  name = "kind"
}

resource "kind_cluster" "kind" {
  depends_on = [docker_network.kind]

  name = var.cluster_name

  node_image      = "kindest/node:${var.k8s_version}"
  kubeconfig_path = pathexpand("${var.cluster_name}-kubeconfig.conf")
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    containerd_config_patches = [
      <<-TOML
      [plugins."io.containerd.grpc.v1.cri".registry.mirrors."localhost:5000"]
          endpoint = ["http://kind-registry:5000"]
      TOML
    ]
  }
}

provider "flux" {
  kubernetes = {
    host                   = kind_cluster.kind.endpoint
    cluster_ca_certificate = kind_cluster.kind.cluster_ca_certificate
    client_key             = kind_cluster.kind.client_key
    client_certificate     = kind_cluster.kind.client_certificate
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
  depends_on = [kind_cluster.kind]
  count      = var.flux ? 1 : 0

  delete_git_manifests = false
  path                 = "clusters/${var.cluster_name}"
}

provider "kubernetes" {
  host                   = kind_cluster.kind.endpoint
  cluster_ca_certificate = kind_cluster.kind.cluster_ca_certificate
  client_key             = kind_cluster.kind.client_key
  client_certificate     = kind_cluster.kind.client_certificate
}

resource "kubernetes_secret" "bitwarden" {
  depends_on = [kind_cluster.kind]
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
  depends_on = [kind_cluster.kind, flux_bootstrap_git.flux]
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
  depends_on = [kind_cluster.kind]
}

locals {
  # renovate: datasource=docker depName=registry.k8s.io/cloud-provider-kind/cloud-controller-manager
  cloud_provider_kind_version = "v0.7.0"
}

resource "docker_image" "cloud_provider_kind" {
  name = "registry.k8s.io/cloud-provider-kind/cloud-controller-manager:${local.cloud_provider_kind_version}"
}

resource "docker_container" "cloud_provider_kind" {
  depends_on = [kind_cluster.kind, docker_network.kind]

  name  = "cloud-provider-kind"
  image = docker_image.cloud_provider_kind.image_id

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
  }

  networks_advanced {
    name = docker_network.kind.id
  }
}
