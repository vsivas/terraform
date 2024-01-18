
provider "aws" {
    region = "us-east-1"
}

/*resource "aws_instance" "ec2-1" {
  ami = var.ami
  instance_type = var.instance_type
}

# Example (cidr_blocks) for using conditional expressions - condition? truevalue : falsevalue


resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.environment == "production" ? [var.production_cidr] : [var.development_cidr]
  }
}*/

