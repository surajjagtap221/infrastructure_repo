output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}
#output "eks_cluster_id" {
# value = aws_eks_cluster.eks_cluster.id
#}
output "eks_cluster_arn" {
  value = aws_eks_cluster.eks_cluster.arn
}
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
output "eks_cluster_version" {
  value = aws_eks_cluster.eks_cluster.version
}

output "eks_cluster_certificate_authority_data" {
  value     = aws_eks_cluster.eks_cluster.certificate_authority[0].data
  sensitive = true
}
output "eks_oidc_issuer_url" {
  value = aws_iam_openid_connect_provider.eks_oidc.url
}
output "eks_oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks_oidc.arn
}


output "eks_launch_template_id" {
  value = aws_launch_template.eks_node_template.id
}
output "eks_launch_template_latest_version" {
  value = aws_launch_template.eks_node_template.latest_version
}


output "eks_node_group_system_name" {
  value = aws_eks_node_group.system.node_group_name
}


output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}
output "eks_cluster_role_name" {
  value = aws_iam_role.eks_cluster_role.name
}
output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}
output "eks_node_role_name" {
  value = aws_iam_role.eks_node_role.name
}