resource "aws_security_group" "prod_sg" {
  vpc_id = aws_vpc.prod_vpc.id

  ingress {
    description = "Allow SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["77.88.202.98/32", "178.54.200.233/32", "3.123.4.54/32"]
  }

  ingress {
    description = "Allow Web-connections from anywhere"
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound access rule"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
