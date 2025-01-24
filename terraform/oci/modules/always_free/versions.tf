# tflint-ignore: terraform_required_version
terraform {
  required_providers {
    # tflint-ignore: terraform_required_providers
    oci = {
      source = "oracle/oci"
    }
  }
}
