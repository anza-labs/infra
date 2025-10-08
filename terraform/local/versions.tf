terraform {
  required_version = ">= 1.8"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "1.7.3"
    }

    kind = {
      source  = "tehcyx/kind"
      version = "0.9.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
  }
}
