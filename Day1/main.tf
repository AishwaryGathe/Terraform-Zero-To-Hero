resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "VPC-terraform"
    }
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    tags = {
        "Name" = "Subnet-terraform1"
    }
}

resource "aws_instance" "name" {
    ami = var.aws_instance
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name.id
    tags={
        "Name" = "Instance-terraform1"
    }
}

resource "aws_instance" "name2" {
    ami = var.aws_instance
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name.id
    tags={
        "Name" = "variable-EC2"
    }
}