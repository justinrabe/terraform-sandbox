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
resource "aws_instance" "leader" {
  count = 3
  ami = "ami-0f1ee03d06c4c659c"
  instance_type = "t2.micro"
  
  tags = {
    Name = "leader-${count.index}"
  }
}