resource "aws_db_instance" "dev-db" {

    tags = {
      Name="dev-db"
    }

    allocated_storage = var.allocated_storge
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    username = var.username
    password = var.passwd
    db_name = var.db_name
    publicly_accessible = var.public-accesible
    skip_final_snapshot  = true
}
