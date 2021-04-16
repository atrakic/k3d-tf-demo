locals {
  name        = "k3d-tf-demo"
  config_path = "~/.kube/config"
}

provider "kubernetes" {
  config_path = local.config_path
}

provider "helm" {
  kubernetes {
    config_path = local.config_path
  }
}

resource "kubernetes_namespace" "this" {
  metadata {
    name = local.name
  }
}

resource "helm_release" "demo" {
  name      = local.name
  chart     = "./Charts/demo"
  namespace = kubernetes_namespace.this.metadata[0].name
}
