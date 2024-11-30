terraform {
  required_version = ">= 1.8"

  backend "pg" {
    schema_name = "tofu_remote_state_linode"
  }

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.31.1"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }
}
