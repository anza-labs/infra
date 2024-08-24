variable "tenancy_ocid" {
  type        = string
  description = "Tenancy ocid where to create the sources."
}

variable "instance_name" {
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
