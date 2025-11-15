provider "aws" {
    profile = "prod"
    region = "us-west-2"
}

module "prod-vpc" {
    source = "../../modules/Networking"
    cidr_block = var.cidr_block
    tag-name = "VPC-B"
}