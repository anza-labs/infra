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

  validation {
    condition     = !(var.flux && (var.github_repo == null || var.github_repo == ""))
    error_message = "'github_repo' must be set when 'flux' is true."
  }
}

variable "github_token" {
  type     = string
  nullable = false

  validation {
    condition     = !(var.flux && (var.github_token == null || var.github_token == ""))
    error_message = "'github_token' must be set when 'flux' is true."
  }
}

variable "bitwarden_token" {
  type     = string
  nullable = false

  validation {
    condition     = !(var.flux && (var.bitwarden_token == null || var.bitwarden_token == ""))
    error_message = "'bitwarden_token' must be set when 'flux' is true."
  }
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
