variable "k8s_version" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "docker_socket" {
  type    = string
  default = "unix:///var/run/docker.sock"
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

