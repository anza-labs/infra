terraform {
  backend "pg" {}

  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.25.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.2"
    }
  }
}
