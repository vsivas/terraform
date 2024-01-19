provider "aws" {
  region = "us-east-1"
}
variable "ami" {
  description = "value"
}
variable "instance_type" {
  description = "value"
}

resource "aws_instance" "name" {
  ami = var.ami
  instance_type = var.instance_type
}