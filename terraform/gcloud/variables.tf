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
  default     = "a"

  validation {
    condition     = contains(["a", "b", "c"], var.zone)
    error_message = "Region must be one of: a, b, c."
  }
}
