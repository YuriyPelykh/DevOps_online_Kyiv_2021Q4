echo "======== TF-AWS Start ========="

dev_d=../../repository/terraform/dev
if [ ! -e  $dev_d ]
  then
    mkdir $dev_d
fi
cat << EOF > ./main.tf
provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "dev_env" {
  ami = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.dev_env_sg.name]

  tags = {
    Name = "Dev_Environment"
    Owner = "Yurii Pelykh"
    Project = "Final Project"
  }
}

resource "aws_security_group" "dev_env_sg" {
  name = "dev_env_sg"
  description = "Allow access to server where dev environment provisioned"

  ingress {
    description = "Allow SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["77.88.202.98/32", "178.54.200.233/32"]
    security_groups = ["sg-048f812377911a49c"]
  }

  ingress {
    description = "Allow Web-connections from anywhere"
    from_port = 0
    to_port = 8080
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

output "instance_public_ip" {
  value = aws_instance.dev_env.public_ip
}
EOF
echo "======= Terraform config file made ======="

terraform init
instance_ip=`terraform apply -auto-approve | grep instance_public_ip | awk '{print $3}'`

cp -rT ./ ../../repository/terraform/dev

echo "========== Making Ansible config =========="

echo "$instance_ip fist time"
