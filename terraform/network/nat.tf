resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = merge(
  local.common_tags,
  {
    Name = "${var.project_name}-${var.environment}-nat-eip"
  }
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnets[0].id

  tags = merge(
  local.common_tags,
  {
    Name = "${var.project_name}-${var.environment}-nat-gateway"
  }
)
  depends_on = [aws_internet_gateway.igw]
}