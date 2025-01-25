# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    # tflint-ignore: terraform_required_providers
    google = {
      source = "hashicorp/google"
    }
  }
}
