resource "aws_eks_node_group" "system" {

  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.project_name}-${var.node_group_name}"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = local.network.private_app_subnet_ids

  capacity_type = var.capacity_type

  instance_types = var.instance_type

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  launch_template {
    id      = aws_launch_template.eks_node_template.id
    version = var.launch_template_version
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

  labels = var.node_labels

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.node_group_name}"
    }
  )

  lifecycle {
    create_before_destroy = false
  }

  depends_on = [
    aws_eks_cluster.eks_cluster,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_container_registry_read_only,
    aws_iam_role_policy_attachment.eks_node_policy
  ]

}