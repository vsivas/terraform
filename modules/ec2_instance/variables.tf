variable "instance_type" {
   default = "t2.micro"
}

variable "ami" {
  default = "ami-0005e0cfe09cc9050"
}
variable "environment" {
    description = "Environment type"
  type        = string
  default     = "development"
}

variable "production_cidr" {
    default = "10.0.0.0/16"
}

variable "development_cidr" {
  default = "192.168.0.0/16"
}
variable "security_group_id" {
 description = "this is SGid"
}
