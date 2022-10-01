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
resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production-vpc"
  }
}
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.prod-vpc.id
}



