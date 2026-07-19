locals {

  network = {
    vpc_id                 = data.terraform_remote_state.network.outputs.vpc_id
    private_app_subnet_ids = data.terraform_remote_state.network.outputs.private_app_subnet_ids
  }

  security = {
    eks_cluster_sg_id = data.terraform_remote_state.security.outputs.eks_cluster_sg_id
    eks_node_sg_id    = data.terraform_remote_state.security.outputs.eks_node_sg_id
  }

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
