terraform {
  backend "s3" {
    bucket = "team-alpha-bucket"
    key = "prod/terraformstatefiles/terraform.tfstate"
    region = "us-east-1"
      }
}