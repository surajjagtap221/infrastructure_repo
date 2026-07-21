output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}
output "private_app_subnet_ids" {
  value = aws_subnet.private_app_subnets[*].id
}
output "private_db_subnet_ids" {
  value = aws_subnet.private_db_subnets[*].id
}

output "public_route_table_id" {
  value = aws_route_table.public_RT.id
}
output "private_route_table_ids" {
  value = aws_route_table.private_app_RT.id
}
output "private_db_RT" {
  value = aws_route_table.private_db_RT.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "availability_zones" {
  value = var.availability_zones
}