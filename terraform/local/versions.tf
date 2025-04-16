terraform {
  required_version = ">= 1.8"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.2.0"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "1.5.1"
    }

    kind = {
      source  = "tehcyx/kind"
      version = "0.8.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}
