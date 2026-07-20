# NACLs for public subnets
resource "aws_network_acl" "public_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.public_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    rule_no    = 120
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-public-nacl"
    }
  )
}

# NACLs for private app subnets
resource "aws_network_acl" "private_app_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.private_app_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}${var.environment}-private-app-nacl"
    }
  )
}

# NACLs for private db subnets
resource "aws_network_acl" "private_db_nacl" {
  vpc_id = local.network.vpc_id

  subnet_ids = local.network.private_db_subnet_ids

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    rule_no    = 110
    protocol   = "tcp"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = local.network.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-private-db-nacl"
    }
  )
}