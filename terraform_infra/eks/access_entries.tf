#############################################################################################
# IAM Role - EKS ReadOnly
#############################################################################################

resource "aws_iam_role" "eks_readonly_role" {

  name = "${var.project_name}-eks-readonly-role"

  description = "IAM Role for EKS Read Only Access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-eks-readonly-role"
    }
  )
}

#############################################################################################
# IAM Policy Attachment - Read Only
#############################################################################################

resource "aws_iam_role_policy_attachment" "eks_readonly_policy" {

  role = aws_iam_role.eks_readonly_role.name

  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"

}


#############################################################################################
# EKS Access Entry - ReadOnly
#############################################################################################

resource "aws_eks_access_entry" "eks_readonly" {

  cluster_name = aws_eks_cluster.eks_cluster.name

  principal_arn = aws_iam_role.eks_readonly_role.arn

  type = "STANDARD"

}

#############################################################################################
# EKS Access Policy Association - ReadOnly
#############################################################################################

resource "aws_eks_access_policy_association" "eks_readonly" {

  cluster_name = aws_eks_cluster.eks_cluster.name

  principal_arn = aws_iam_role.eks_readonly_role.arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"

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
