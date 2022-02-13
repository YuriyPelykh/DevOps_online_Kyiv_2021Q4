output "instance_public_ips" {
  value = aws_instance.prod.*.public_ip
}

output "rds_instance_endpoint" {
  value = aws_db_instance.db.address
}
