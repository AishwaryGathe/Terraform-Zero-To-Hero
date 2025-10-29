terraform {
  backend "s3" {
    bucket = "terraform-skyops-team"
    key    = "Day3/terraform.tfstate"
    region = "us-east-1"
  }
}