variable "k8s_version" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-central"
}

variable "root" {
  type    = string
  default = "."
}

variable "flux" {
  type    = bool
  default = false
}

variable "github_repo" {
  type = string
}

variable "github_token" {
  type = string
}

variable "bitwarden_token" {
  type = string
}
