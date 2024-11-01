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

resource "null_resource" "kubeconfig" {
  depends_on = [
    linode_lke_cluster.lke,
  ]

  triggers = {
    kubeconfig = md5(linode_lke_cluster.lke.kubeconfig)
    output     = md5(var.kubeconfig)
    script     = filemd5("${var.root}/scripts/kubeconfig.sh")
  }

  provisioner "local-exec" {
    command = "${var.root}/scripts/kubeconfig.sh '${pathexpand(var.kubeconfig)}' '${linode_lke_cluster.lke.id}' '${linode_lke_cluster.lke.kubeconfig}'"
  }
}
