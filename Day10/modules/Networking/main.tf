resource "aws_vpc" "VPC-A" {
    cidr_block = var.cidr_block
    tags = {
      Name = var.tag-name
    }
}