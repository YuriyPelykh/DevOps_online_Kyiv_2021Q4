provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "Ubuntu20_Server1" {
  ami = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  tags = {
    Name = "Ubuntu Srver 1"
    Owner = "DevOps Yurii Pelykh"
    Project = "Terraform Intro"
  }
}

resource "aws_instance" "Ubuntu20_Server2" {
  ami = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  tags = {
    Name = "Ubuntu Srver 2"
    Owner = "DevOps Yurii Pelykh"
    Project = "Terraform Intro"
  }
}
