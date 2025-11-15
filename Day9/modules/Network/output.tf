output "vpc_id" {
    value = aws_vpc.VPC-A.id  
}

output "subnet_ids" {
    value = [aws_subnet.SN-1.id, aws_subnet.SN-2.id]
}