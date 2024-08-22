provider "linode" {}

resource "linode_lke_cluster" "lke" {
  k8s_version = var.version
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
    script     = filemd5("./scripts/kubeconfig.sh")
  }

  provisioner "local-exec" {
    command = "./scripts/kubeconfig.sh '${pathexpand(var.kubeconfig)}' '${linode_lke_cluster.lke.id}' '${linode_lke_cluster.lke.kubeconfig}'"
  }
}
