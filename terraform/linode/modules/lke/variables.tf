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
  type     = string
  nullable = false
}

variable "github_token" {
  type     = string
  nullable = false
}

variable "bitwarden_token" {
  type     = string
  nullable = false
}

variable "discord_webhook" {
  type     = string
  nullable = false
}

variable "node_pools" {
  type = list(object({
    type  = string
    count = number
  }))

  default = [
    { type = "g6-standard-2", count = 3 },
  ]
}
