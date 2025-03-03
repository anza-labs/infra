variable "region" {
  description = "The region where the instance will be created."
  type        = string
  default     = "us-west1"
  validation {
    condition     = contains(["us-west1", "us-central1", "us-east1"], var.region)
    error_message = "Region must be one of: us-west1, us-central1, us-east1."
  }
}
