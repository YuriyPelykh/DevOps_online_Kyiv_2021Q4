output "instance_public_ips" {
  value = aws_instance.prod.*.public_ip
}
