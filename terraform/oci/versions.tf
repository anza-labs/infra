terraform {
  backend "pg" {
    schema_name = "tofu_remote_state_oci"
  }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.7.0"
    }
  }
}
