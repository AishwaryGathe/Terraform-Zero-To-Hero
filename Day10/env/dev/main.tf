provider "aws" {
    profile = "dev"
    region = "us-east-1"
}

module "dev-vpc" {
    source = "../../modules/Networking"
    cidr_block = var.cidr_block
    tag-name = "VPC-A"
}