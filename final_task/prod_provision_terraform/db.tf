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
  vpc_security_group_ids = [ aws_security_group.prod_sg.id ]
  skip_final_snapshot = true
}


#resource "aws_db_security_group" "db_sg" {
#  name = "rds_sg"
#
#  ingress {
#    cidr = "178.54.200.233/32"
#    security_group_name = "sg-048f812377911a49c"
#  }
#}

resource "aws_db_subnet_group" "prod_db_subnet" {
  name = "prod_db_subnet"
  subnet_ids = [ aws_subnet.prod_subnet.id, aws_subnet.prod_subnet_1.id ]
}
