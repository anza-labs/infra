terraform {
  required_version = ">= 1.8"

  backend "pg" {
    schema_name = "tofu_remote_state_linode"
  }

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.32.0"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "1.4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
}
