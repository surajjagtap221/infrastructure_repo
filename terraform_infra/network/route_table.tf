resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-public-route-table"
    }
  )
}

resource "aws_route_table" "private_app_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-private-app-route-table"
    }
  )
}

resource "aws_route_table" "private_db_RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-private-db-route-table"
    }
  )
}

resource "aws_route_table_association" "public_association" {
  count = 3

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_RT.id
}

resource "aws_route_table_association" "private_app_association" {
  count = 3

  subnet_id      = aws_subnet.private_app_subnets[count.index].id
  route_table_id = aws_route_table.private_app_RT.id
}

resource "aws_route_table_association" "private_db_association" {
  count = 3

  subnet_id      = aws_subnet.private_db_subnets[count.index].id
  route_table_id = aws_route_table.private_db_RT.id
}
