output "endpoint" {
    value = aws_db_instance.dev.endpoint
}

output "arn" {
    value = aws_db_subnet_group.sn-grp.arn
}