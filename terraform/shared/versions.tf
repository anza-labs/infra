terraform {
  required_version = ">= 1.8"

  backend "pg" {
    schema_name = "tofu_remote_state_shared"
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.17.0"
    }

    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = "0.17.3"
    }
  }
}
