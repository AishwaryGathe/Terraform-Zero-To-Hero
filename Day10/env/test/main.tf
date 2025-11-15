provider "aws" {
    profile = "test"
    region = "us-east-1"
}

module "test-vpc" {
    source = "../../modules/Networking"
    cidr_block = var.cidr_block
    tag-name = "VPC-C"
}