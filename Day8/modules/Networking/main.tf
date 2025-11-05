resource "aws_vpc" "VPC-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name="VPC-1"
  }
}

resource "aws_subnet" "subnet-2a" {
    tags = {
      Name = "Subnet-2a"
    }
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    vpc_id = aws_vpc.VPC-1.id
}
resource "aws_subnet" "subnet-2b" {
    tags = {
      Name = "Subnet-2b"
    }
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    vpc_id = aws_vpc.VPC-1.id
}

resource "aws_db_subnet_group" "sg-grp" {
    name = "db-subnet-group"
    subnet_ids = [aws_subnet.subnet-2a.id,aws_subnet.subnet-2b.id]
    tags = {
      Name="db-subnet-group"
    }
}