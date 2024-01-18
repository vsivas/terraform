provider "aws" {
  region = "us-east-1"
}

variable "cidr"{
    default = "10.0.0.0/16"
}

resource "aws_key_pair" "kpair" {
  key_name = "sivaKeyPair"
  public_key = file("C:\\Users\\SI20224507\\.ssh\\id_rsa.pub")
  
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "RT" {
vpc_id = aws_vpc.myvpc.id

route  {
    cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
}

resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "webSg" {
    name ="web"
   vpc_id = aws_vpc.myvpc.id
   ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web-sg"
  }
}
  resource "aws_instance" "server" {
    ami = "ami-0261755bbcb8c4a84"
    instance_type = "t2.micro"
    key_name = aws_key_pair.kpair.key_name
    vpc_security_group_ids = [aws_security_group.webSg.id]
    subnet_id = aws_subnet.sub1.id
    associate_public_ip_address = true
    tags = {
      Name = "WebServer"
    }
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("C:\\Users\\SI20224507\\.ssh\\id_rsa")
      host = self.public_ip
    }

    #File provisioner to copy a file from local to the remote EC2 instance
     provisioner "file" {
       #source = "C:\\Users\\SI20224507\\Project work\\terraform\\AWS\\terraform\\modules\\Provisioners-DeployAppFullScenario\\app.py"
        source = "modules\\Provisioners-DeployAppFullScenario\\app.py"
           destination = "/home/ubuntu/app.py"
     
     }

     provisioner "remote-exec" {
       inline = [ 
        "echo 'Hello from the remote instance'",
         "sudo apt-get update -y",
         "sudo apt-get install python3-pip -y",
          "cd /home/ubuntu",
         "sudo pip3 install flask",
         "sudo python3 /home/ubuntu/app.py"
        ]
     }
  }
