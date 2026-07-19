output "eks_node_sg_id" {
  value = aws_security_group.eks_node.id
}
output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster.id
}
output "database_sg_id" {
  value = aws_security_group.database_sg.id
}
output "alb_public_sg_id" {
  value = aws_security_group.alb_public.id
}