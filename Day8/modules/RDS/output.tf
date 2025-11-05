output "endpoint" {
    value =aws_db_instance.dev-db.endpoint
}

output "arn" {
  value = aws_db_instance.dev-db.arn
}