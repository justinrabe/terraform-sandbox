# variable "a_key"{
#   type = string
# }
# variable "s_key"{
#   type = string
# }
# provider "aws" {
#   region = "us-east-1"
#   access_key = var.a_key
#   secret_key = var.s_key
# }
# resource "aws_vpc" "vpc-test" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "production-vpc"
#   }
# }
# resource "aws_subnet" "subnet1" {
#   vpc_id     = aws_vpc.vpc-test.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "prod-subnet"
#   }
# }
# resource "aws_instance" "server-sandbox" {
#   ami           = "ami-026b57f3c383c2eec"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "test"
#   }
# }