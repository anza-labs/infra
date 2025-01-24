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
