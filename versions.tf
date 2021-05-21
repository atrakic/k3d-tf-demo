terraform {
  required_version = ">= 0.12.6"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.2.0"
    }
  }
}
