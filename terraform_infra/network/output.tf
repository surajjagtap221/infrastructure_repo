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