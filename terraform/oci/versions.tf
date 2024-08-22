terraform {
  backend "pg" {}

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.7.0"
    }
  }
}
