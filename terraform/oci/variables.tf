variable "tenancy_ocid" {
  type        = string
  description = "Tenancy ocid where to create the sources."
}

variable "user_ocid" {
  type        = string
  description = "Ocid of user that terraform will use to create the resources."
}

variable "fingerprint" {
  type        = string
  description = "Fingerprint of OCI API Private Key."
}

variable "private_key" {
  type        = string
  description = "Contents of OCI API Private Key used."
}

variable "ssh_public_keys" {
  type        = string
  description = "Public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance."
}

variable "region" {
  type        = string
  description = "The oci region where resources will be created."
  default     = "eu-frankfurt-1"
}

variable "availability_domain" {
  type        = number
  description = "Availability Domain of the instance."
  default     = 3
}

variable "instance_source_id" {
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
