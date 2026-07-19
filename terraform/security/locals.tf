locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
locals {
  network = data.terraform_remote_state.network.outputs
}