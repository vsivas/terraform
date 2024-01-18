provider "aws" {
    region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  instance_type =  "t2.micro"
ami = "ami-0005e0cfe09cc9050"
security_group_id = "sg-674d9035"
}

module "aws_s3_bucket" {
  source = "./modules/s3bucket"
  
}