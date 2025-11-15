provider "aws" {}


module "network" {
    source = "./modules/Network"
    cidr_b =  var.vpc_cidr #vpc
    subnet_cidr-1 = "10.0.1.0/24"
    subnet_cidr-2 = "10.0.2.0/24"
    az-1 = "us-east-1a"
    az-2 = "us-east-1b"
}

module "database" {
    source = "./modules/RDS"
    allo-storage = 20
    engine = "mysql"
    insta_class = "db.t3.micro"
    u-name = "admin"
    u-pass = "admin123"
    subnet_ids = module.network.subnet_ids
}