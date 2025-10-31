# Creating VPC
resource "aws_vpc" "VPC-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC-1"
  }
}

# creating subnet-1a
resource "aws_subnet" "subnet-1a" {
  vpc_id = aws_vpc.VPC-1.id
  tags = {
    Name = "Subnet-1a"
  }
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"
}

# creating subnet-1b
resource "aws_subnet" "subnet-1b" {
  vpc_id = aws_vpc.VPC-1.id
  tags = {
    Name = "Subnet-1b"
  }
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.2.0/24"
}

# create Internet Gatway
resource "aws_internet_gateway" "IG-1" {
  tags = {
    Name = "IG-1"
  }
  vpc_id = aws_vpc.VPC-1.id
}

#Create Elastic IP
resource "aws_eip" "EIP-1" {
    domain = "vpc"
    tags = {
      Name = "EIP-1"
    }
}

# Create NAT gatway
resource "aws_nat_gateway" "NAT-1" {
    tags = {
      Name = "NAT-1"
    }
    subnet_id = aws_subnet.subnet-1a.id
    connectivity_type = "public"
    allocation_id = aws_eip.EIP-1.id
}


#creating Security Group
resource "aws_security_group" "SG-1" {   
    
    tags = {
      Name = "SG-1"
    }
    description = "Secrutiy group"
    vpc_id = aws_vpc.VPC-1.id
    name = "SG-1"

  ingress {
    description = "SSH"
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Http"
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "https"
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#public RT
resource "aws_route_table" "RT-pub" {
    tags = {
      Name = "RT-Pub"
    }
    vpc_id = aws_vpc.VPC-1.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IG-1.id
    }
}

#subnet asscot
resource "aws_route_table_association" "RT-Pub-ASS" {
    route_table_id = aws_route_table.RT-pub.id
    subnet_id = aws_subnet.subnet-1a.id
}

#create RT-Pri
resource "aws_route_table" "RT-Pri" {
    tags = {
      Name = "RT-Pri"
    }
    vpc_id = aws_vpc.VPC-1.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.NAT-1.id
    }
}

resource "aws_route_table_association" "RT-Pri-ASS" {
    route_table_id = aws_route_table.RT-Pri.id
    subnet_id = aws_subnet.subnet-1b.id
}


resource "aws_instance" "Pub-EC2-1a" {
    tags = {
      Name = "Pub-EC2-1a"
    }
    ami = "ami-0bdd88bd06d16ba03"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnet-1a.id
    vpc_security_group_ids = [aws_security_group.SG-1.id]
    associate_public_ip_address = true
}

resource "aws_instance" "Pri-EC2-1b" {
    tags = {
      Name = "Pri-EC2-1b"
    }
    ami = "ami-0bdd88bd06d16ba03"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnet-1b.id
    vpc_security_group_ids = [aws_security_group.SG-1.id]
    associate_public_ip_address = false
}