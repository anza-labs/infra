# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    # tflint-ignore: terraform_required_providers
    oci = {
      source = "oracle/oci"
    }

    # tflint-ignore: terraform_required_providers
    tailscale = {
      source = "tailscale/tailscale"
    }
  }
}

provider "tailscale" {
  tailnet             = var.tailscale_tailnet
  oauth_client_id     = var.tailscale_oauth_client_id
  oauth_client_secret = var.tailscale_oauth_secret
}
