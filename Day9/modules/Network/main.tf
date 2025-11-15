resource "aws_vpc" "VPC-A" {
  tags = {
    Name = "VPC-A"
  }
  cidr_block = var.cidr_b
}

resource "aws_subnet" "SN-1" {
  vpc_id = aws_vpc.VPC-A.id
  tags = {
    Name = "Subnet-1"
  }

  cidr_block        = var.subnet_cidr-1
  availability_zone = var.az-1
}

resource "aws_subnet" "SN-2" {
  vpc_id = aws_vpc.VPC-A.id
  tags = {
    Name = "Subnet-2"
  }

  cidr_block        = var.subnet_cidr-2
  availability_zone = var.az-2
}

