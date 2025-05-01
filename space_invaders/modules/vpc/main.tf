resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "subnet" {
  count = length(var.subnets)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnets[count.index].cidr_block
  availability_zone = var.subnets[count.index].zone

  tags = {
    Name = "${var.prefix}-vpc-subnet-${var.subnets[count.index].zone}"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.prefix}-vpc-ig"
  }
}

resource "aws_default_route_table" "rt" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  default_route_table_id = aws_vpc.vpc.default_route_table_id
}
