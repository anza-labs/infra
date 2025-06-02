terraform {
  required_version = ">= 1.8"

  backend "pg" {
    schema_name = "tofu_remote_state_linode"
  }

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.41.0"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "1.6.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.37.1"
    }

    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = "0.13.6"
    }
  }
}
