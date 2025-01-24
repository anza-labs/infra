variable "tenancy_ocid" {
  type        = string
  description = "Tenancy ocid where to create the sources."
}

variable "name" {
  type        = string
  description = "Shared name of the resources."
}

variable "availability_domain" {
  type        = number
  description = "Availability Domain of the instance."
}

