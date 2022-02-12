echo "======== TF-AWS Start ========="

dev_d=../../repository/terraform/dev
ans_d=../../repository/ansible/dev
if [ ! -e  $dev_d ]
  then
    mkdir -p $dev_d
fi
if [ ! -e  $ans_d ]
  then
    mkdir -p $ans_d
fi
cat << EOF > ./main.tf
provider "aws" {
  region = "eu-central-1"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "ec2_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7GFSyHWLcq/kWyEM4Om3VaxmgxG7T7IwiJMteHlnAiqJMPGOM453k5DYJqz1mizx9ZJk2o2iIVd/lLuaIdXt9cAGel/ebPs6dVXEdB4EivZY3dAbtXhQ4urV+ScjXRtEcTLt48/ko+Mx3s2dzgD8kpnoLUA2uljaFHrHfNkcjiyCIdWSJA1Nh3SPjr/h2YryLfeGbjGujBgaMOgbDvSADvWBgw87ThYFVB35EqjJx58yMriF9vXmdO2s2N4Lj1Dl5hVlvLTJDrRtBH2fOxH1y1U7koj59y7cvcAd8NIi1Tiac6wg8DXCLg0SFW/tAwktioBu3lNt70Sz3osqz0gUX+Sd7w5jdokh0VIR7JgejVIiGLkAqW/eubL7cIO3gmVoSv0RxEXyXIqWhR6NMgJk+7uHr7ME9RxhIdTB9BEsTlpIb5DpIBgPo9o2oPI/OV2ebICXvqAZDqynJ74zNQu/QOfDA6npZuM+2LJes/2CskGDT5LRjc7hGmeOJyG2o15s= ubuntu@ip-172-31-23-38"
}

resource "aws_instance" "dev" {
  ami = "ami-0d527b8c289b4af7f"
  instance_type = "t2.micro"
  key_name = aws_key_pair.key_pair.id

  security_groups = [aws_security_group.dev_env_sg.name]

  tags = {
    Name = "Dev_Environment_1"
    Owner = "Yurii Pelykh"
    Project = "Final Project"
  }
  depends_on = [aws_key_pair.key_pair]
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
    from_port = 8000
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

output "instance_public_ips" {
  value = aws_instance.dev.*.public_ip
}
EOF
echo "======= Terraform config file made ======="

terraform init
terraform apply -auto-approve
terraform output | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > $ans_d/instance_ips

cp -rT ./ ../../repository/terraform/dev
