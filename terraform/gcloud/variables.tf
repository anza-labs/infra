variable "project_id" {
  description = "ID of project."
  type        = string
}

variable "region" {
  description = "The region where the resources will be created."
  type        = string
  default     = "us-east1"

  validation {
    condition     = contains(["us-west1", "us-central1", "us-east1"], var.region)
    error_message = "Region must be one of: us-west1, us-central1, us-east1."
  }
}

variable "zone" {
  description = "The zone where the zoned resources will be created."
  type        = string
  default     = "c"
}

variable "discord_webhook" {
  type        = string
  description = "Discord Webhook"
}

variable "ssh_public_keys" {
  type        = string
  description = "Public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance."
}

variable "tailscale_oauth_client_id" {
  type        = string
  description = "OAuth Client ID for Tailscale."
}

variable "tailscale_oauth_secret" {
  type        = string
  description = "OAuth Secret for Tailscale."
}

variable "tailscale_tailnet" {
  type        = string
  description = "Tailscale Tailnet name."
}
