# EKS Access Entries
resource "aws_eks_access_entry" "cluster_admin" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  principal_arn = data.aws_caller_identity.devsecops_admin.arn
  type = "STANDARD"
}

# EKS Access Policy Association - Cluster Admin
resource "aws_eks_access_policy_association" "cluster_admin" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  principal_arn = data.aws_caller_identity.devsecops_admin.arn
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterAdminPolicy"
  
  access_scope {
    type = "cluster"
  }
}


################################################
# Future Access Entries
#
# - DevOps Team
# - Platform Team
# - Developers
# - Read Only Users
# - CI/CD Pipeline
# - GitHub Actions
# - Jenkins
# - Security Team
################################################