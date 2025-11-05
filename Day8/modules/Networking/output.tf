output "vpc_id" {
    value = aws_vpc.VPC-1.id
}

output "subnet_ids" {
    value = [aws_subnet.subnet-2a.id, aws_subnet.subnet-2b.id]
  
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.sg-grp.name
}