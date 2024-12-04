# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    # tflint-ignore: terraform_required_providers
    linode = {
      source = "linode/linode"
    }

    # tflint-ignore: terraform_required_providers
    flux = {
      source = "fluxcd/flux"
    }

    # tflint-ignore: terraform_required_providers
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
