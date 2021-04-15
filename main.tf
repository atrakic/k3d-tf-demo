locals {
  name = "k3d-tf-demo"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "this" {
  metadata {
    name = local.name
  }
}
