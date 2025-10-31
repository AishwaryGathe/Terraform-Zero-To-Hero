provider "aws" {
  
}

resource "aws_instance" "instance-1" {

    tags = {
      Name ="instance-1"
    }
    ami = "ami-0bdd88bd06d16ba03"
    instance_type = "t2.micro"

    # lifecycle {
    #   create_before_destroy = true
    # }


    # lifecycle {
    #   ignore_changes = [ tags ]
    # }


    # lifecycle {
    #   prevent_destroy = true
    # }

}