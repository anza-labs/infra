variable "k8s_version" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_mode" {
  type    = string
  default = "infra"
  validation {
    condition     = contains(["infra", "workload"], var.cluster_mode)
    error_message = "cluster_mode must be either 'infra' or 'workload'."
  }
}

variable "infra_cluster" {
  type     = string
  nullable = true
  default  = null
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

variable "project_id" {
  type = string
}
