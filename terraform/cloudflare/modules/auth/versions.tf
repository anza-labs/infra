# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    # tflint-ignore: terraform_required_providers
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}
