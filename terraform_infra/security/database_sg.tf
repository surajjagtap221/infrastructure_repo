resource "aws_security_group" "database_sg" {
  name        = "${var.project_name}-database-sg"
  description = "Security Group for RDS Database"
  vpc_id      = local.network.vpc_id

  ingress {
    description     = "Allow MySQL traffic from EKS Worker Nodes"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.eks_node.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-database-sg"
    }
  )
}