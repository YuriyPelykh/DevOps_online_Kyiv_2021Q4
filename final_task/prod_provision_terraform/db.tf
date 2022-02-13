resource "aws_db_instance" "db" {
  allocated_storage = 20
  db_subnet_group_name = aws_db_subnet_group.prod_db_subnet.name
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  db_name = "petclinic"
  username = "petclinic"
  password = "petclinic"
  port = "3306"
  publicly_accessible = "false"
  vpc_security_group_ids = [ aws_security_group.prod_db_sg.id ]
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "prod_db_subnet" {
  name = "prod_db_subnet"
  subnet_ids = [ aws_subnet.prod_subnet_private_1.id, aws_subnet.prod_subnet_private_2.id ]
}
