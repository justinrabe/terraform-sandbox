variable "vpc_id"{
  type = string
}
variable "subnet_id"{
  type = string
}
variable "ec2_sg"{
  type = string
}
variable "instance_profile"{
  type = string
}
variable "key_name"{
  type = string
}
variable "system_tag"{
  type = string
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "subnet-1" {
  vpc_id = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prod-subnet"
  }
}

resource "aws_instance" "web-server" {
  ami = "x" //replace
  instance_type = "t3a.medium"
  availability_zone = "us-east-1a"
  iam_instance_profle = var.instance_profile
  key_name = var.key_name

  

  tags = {
    "Name" = "ABC"
  }
}