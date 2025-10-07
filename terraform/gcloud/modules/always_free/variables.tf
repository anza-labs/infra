variable "instance_name" {
  type        = string
  description = "Name of the instance."
}

variable "instance_shape" {
  type        = string
  description = "Type of an instance"
  default     = "e2-micro"

  validation {
    condition     = contains(["e2-micro"], var.instance_shape)
    error_message = "The instance_shape must be one of the following: e2-micro."
  }
}

variable "region" {
  type        = string
  description = "The region where the instance will be created."
  default     = "us-east1"

  validation {
    condition     = contains(["us-west1", "us-central1", "us-east1"], var.region)
    error_message = "Region must be one of: us-west1, us-central1, us-east1."
  }
}

variable "tailscale_version" {
  type        = string
  description = "Tailscale Version"

  # renovate: datasource=docker depName=tailscale/tailscale
  default = "v1.88.3"
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

variable "otel_collector_config_url" {
  type        = string
  description = "OTel Collector config URL"
}

variable "otel_collector_version" {
  type        = string
  description = "OTel Collector Version"

  # renovate: datasource=docker depName=otel/opentelemetry-collector-k8s
  default = "0.137.0"
}

variable "registry_config_url" {
  type        = string
  description = "Registry config URL"
}

variable "registry_version" {
  type        = string
  description = "OTel Collector Version"

  # renovate: datasource=docker depName=registry
  default = "3.0.0"
}
