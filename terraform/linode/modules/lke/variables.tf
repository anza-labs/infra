variable "version" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-central"
}

variable "kubeconfig" {
  type    = string
  default = "~/.kube/config"
}
