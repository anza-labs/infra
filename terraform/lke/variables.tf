variable "k8s_version" {
  type    = string
  default = "1.29"
}

variable "k8s_cluster_name" {
  type    = string
  default = "kubernetes"
}

variable "k8s_cluster_region" {
  type    = string
  default = "eu-central"
}

variable "kubeconfig" {
  type    = string
  default = "~/.kube/config"
}
