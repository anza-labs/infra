terraform {
  required_version = ">= 1.8"

  backend "pg" {
    schema_name = "tofu_remote_state_oci"
  }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.19.0"
    }

    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.21.1"
    }
  }
}
