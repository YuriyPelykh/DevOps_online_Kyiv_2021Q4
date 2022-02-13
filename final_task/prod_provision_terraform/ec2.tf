resource "aws_instance" "prod" {
  count = 1
  ami = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.prod_subnet_public.id

  vpc_security_group_ids = [ aws_security_group.prod_sg.id ]

  key_name = aws_key_pair.key_pair.id

  depends_on = [ aws_db_instance.db ]

  tags = {
    Name = "Prod_Environment"
  }

  #connection {
  #  type = "ssh"
  #  user = "${var.EC2_USER}"
  #  private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
  #  host = self.public_ip
  #}

  #provisioner "remote-exec" {
  #    inline = [
  #       "sudo apt-get update",
  #       "sudo apt-get -y install openjdk-11-jre-headless"
  #    ]
  #}
}

resource "aws_key_pair" "key_pair" {
  key_name   = "prod_key"
  public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
