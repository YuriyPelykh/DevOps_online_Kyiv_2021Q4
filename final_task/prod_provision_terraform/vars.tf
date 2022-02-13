variable "AWS_REGION" {
    default = "eu-central-1"
}

variable "PRIVATE_KEY_PATH" {
  default = "/var/lib/jenkins/.ssh/id_rsa"
#  default = "/home/ubuntu/.ssh/id_rsa"

}

variable "PUBLIC_KEY_PATH" {
  default = "/var/lib/jenkins/.ssh/id_rsa.pub"
#  default = "/home/ubuntu/.ssh/id_rsa.pub"
}

variable "EC2_USER" {
    default = "ubuntu"
}
