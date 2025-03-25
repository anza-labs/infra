# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    # tflint-ignore: terraform_required_providers
    docker = {
      source = "kreuzwerker/docker"
    }

    # tflint-ignore: terraform_required_providers
    flux = {
      source = "fluxcd/flux"
    }

    # tflint-ignore: terraform_required_providers
    kind = {
      source = "tehcyx/kind"
    }

    # tflint-ignore: terraform_required_providers
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
