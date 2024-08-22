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

variable "instance_name" {
  type        = string
  description = "Name of the instance."
}

variable "availability_domain" {
  type        = number
  description = "Availability Domain of the instance."
  default     = 3
}

variable "region" {
  type        = string
  description = "The oci region where resources will be created."
  default     = "eu-frankfurt-1"
}