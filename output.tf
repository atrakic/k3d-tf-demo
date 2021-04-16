output "self" {
  value = {
    terraform_workspace = terraform.workspace
    last_update         = timestamp()
  }
}

output "demo" {
  value = helm_release.demo.metadata
}
