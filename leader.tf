variable "a_key"{
  type = string
}
variable "s_key"{
  type = string
}
provider "aws" {
  region = "us-east-1"
  access_key = var.a_key
  secret_key = var.s_key
}
data "template_file" "user_data" {
    template = file("ssms_install.ps1")
}
resource "aws_instance" "leader" {
  count = 1
  ami = "ami-0f1ee03d06c4c659c"
  instance_type = "t2.micro"
  key_name = "leader"
  user_data = data.template_file.user_data.rendered
  tags = {
    Name = "leader-${count.index}"
  }
}
resource "aws_vpc" "vpc-test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production-vpc"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc-test.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}
resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow RDP"
  vpc_id      = aws_vpc.vpc-test.id

  ingress {
    description      = "RDP"
    from_port        = 3389
    to_port          = 3389
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_rdp"
  }
}