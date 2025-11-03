resource "aws_instance" "this" {
    ami = var.ami
    instance_type = var.type
    tags = {
      Name = "Terraform-Var"
    }
}