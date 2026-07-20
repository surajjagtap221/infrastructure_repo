# TODO:
# Enable Kubernetes Secrets encryption using AWS KMS
# Production enhancement
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-${var.environment}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.kubernetes_version

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  vpc_config {
    subnet_ids = local.network.private_app_subnet_ids

    security_group_ids = [
      local.security.eks_cluster_sg_id
    ]

    endpoint_private_access = true
    endpoint_public_access  = true
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-cluster"
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}