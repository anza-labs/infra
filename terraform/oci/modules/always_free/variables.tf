variable "tenancy_ocid" {
  type        = string
  description = "Tenancy ocid where to create the sources."
}

variable "instance_name" {
  type        = string
  description = "Name of the instance."
}

variable "instance_shape" {
  type        = string
  description = "Type of an instance"
  default     = "VM.Standard.E2.1.Micro"

  validation {
    condition     = contains(["VM.Standard.A1.Flex", "VM.Standard.E2.1.Micro"], var.instance_shape)
    error_message = "The instance_shape must be one of the following: VM.Standard.A1.Flex, VM.Standard.E2.1.Micro."
  }
}

variable "subnet_id" {
  type        = string
  description = "Name of the instance."
}

variable "availability_domain" {
  type        = number
  description = "Availability Domain of the instance."
}

variable "region" {
  type        = string
  description = "The oci region where resources will be created."
  default     = "eu-frankfurt-1"
}

variable "ssh_public_keys" {
  type        = string
  description = "Public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance."
}

variable "instance_source_type" {
  type        = string
  description = "The source type for the instance."
  default     = "image"
}

variable "source_id" {
  type        = string
  description = "The source ID of the instance."
  nullable    = true
  default     = null
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

variable "discord_webhook" {
  type        = string
  description = "Discord Webhook"
}

variable "tailscale_version" {
  type        = string
  description = "Tailscale Version"

  # renovate: datasource=docker depName=tailscale/tailscale
  default = "v1.88.2"
}

variable "otel_collector_config_url" {
  type        = string
  description = "OTel Collector config URL"
}

variable "otel_collector_version" {
  type        = string
  description = "OTel Collector Version"

  # renovate: datasource=docker depName=otel/opentelemetry-collector-k8s
  default = "0.136.0"
}

variable "registry_config_url" {
  type        = string
  description = "Registry config URL"
}


variable "registry_version" {
  type        = string
  description = "Registry Version"

  # renovate: datasource=docker depName=registry
  default = "3.0.0"
}
