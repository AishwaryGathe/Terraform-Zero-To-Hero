resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Terraform_VPC"
  }
}

resource "aws_subnet" "name" {
  vpc_id = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Terraform_Subnet"
  }
}

resource "aws_instance" "name" {
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.name.id
  tags = {
    Name = "Terraform"
  }
}

resource "aws_s3_bucket" "name" {
  bucket = "terraform-skyops-team"
}