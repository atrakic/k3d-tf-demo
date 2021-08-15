terraform {
  required_version = "~> 0.14"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.4.1"
    }
  }
}
