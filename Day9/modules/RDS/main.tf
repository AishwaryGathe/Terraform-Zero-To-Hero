resource "aws_db_subnet_group" "sn-grp" {
    tags = {
        Name = "SN-Grp"
    }
    subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "dev" {
    identifier = "dev"
    allocated_storage = var.allo-storage
    username = var.u-name
    password = var.u-pass
    engine = var.engine
    instance_class = var.insta_class
    skip_final_snapshot = true
    db_subnet_group_name = aws_db_subnet_group.sn-grp.id
}