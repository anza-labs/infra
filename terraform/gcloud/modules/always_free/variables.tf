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

variable "k3s_version" {
  type        = string
  description = "K3s Version"

  # renovate: datasource=docker depName=rancher/k3s
  default = "v1.33.1-k3s1"
}

variable "discord_webhook" {
  type        = string
  description = "Discord Webhook"
}
