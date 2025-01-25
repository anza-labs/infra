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
  api_key = var.tailscale_api_key
}
