terraform {
  required_version = ">= 1.8"

  backend "pg" {
    schema_name = "tofu_remote_state_gcloud"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.45.0"
    }

    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.21.1"
    }
  }
}
