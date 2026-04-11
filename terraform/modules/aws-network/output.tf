output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_db" {
  value = aws_subnet.db
}
