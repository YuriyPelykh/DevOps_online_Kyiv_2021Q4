resource "aws_instance" "prod" {
  count = 1
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.prod_subnet.id

  vpc_security_group_ids = [ aws_security_group.prod_sg.id ]

  key_name = aws_key_pair.key_pair.id

  depends_on = [ aws_db_instance.db ]

  connection {
    type = "ssh"
    user = "${var.EC2_USER}"
    private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    host = self.public_ip
  }

  provisioner "remote-exec" {
      inline = [
        "sudo -i"
         "apt-get update",
         "apt-get -y install openjdk-11-jre"
      ]
  }

}

resource "aws_key_pair" "key_pair" {
  key_name   = "prod_key"
  public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
