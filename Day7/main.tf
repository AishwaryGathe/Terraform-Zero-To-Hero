provider "aws" {}

module "server1" {
    source = "./modules/EC2Instance"
    ami = var.ami
    type =   "t2.medium"
}

module "server2" {
    source = "./modules/EC2Instance"
    ami = var.ami
    type = var.type
}

