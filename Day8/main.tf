provider "aws" {
  region = "us-east-1"
}

module "Networking" {
  source = "./modules/Networking"

}

module "RDS" {
    source = "./modules/RDS"
  allocated_storge = 10
  engine           = "mysql"
  engine_version   = "8.0"
  instance_class   = "db.t3.micro"
  username         = "admin"
  passwd           = "admin123"
  db_name          = "Dev"
  public-accesible = true
  db_subnet_group_name = module.Networking.db_subnet_group_name
}

output "RDS" {
  value = module.RDS.endpoint
}
