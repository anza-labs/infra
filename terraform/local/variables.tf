variable "github_token" {
  type = string
}

variable "bitwarden_token" {
  type = string
}

variable "discord_webhook" {
  type = string
}

variable "docker_socket" {
  type    = string
  default = "unix:///var/run/docker.sock"
}
