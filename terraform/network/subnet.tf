resource "aws_subnet" "public_subnets" {
  count = 3

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {

      Name = "public-subnet-${count.index + 1}"

      "kubernetes.io/role/elb" = "1"
    }
  )
}

resource "aws_subnet" "private_app_subnets" {
  count = 3

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_app_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    local.common_tags,
    {
      Name = "private-app-subnet-${count.index + 1}"

      "kubernetes.io/role/internal-elb" = "1"
    }
  )
}

# Database subnets remain isolated and intentionally have no default internet route.
resource "aws_subnet" "private_db_subnets" {
  count = 3

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_db_subnets_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    local.common_tags,
    {
      Name = "private-db-subnet-${count.index + 1}"
    }
  )
}