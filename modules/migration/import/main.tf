provider "aws" {
  region = "us-east-1"
}

import{
    id = "i-012xyz" # aws instance id of already created resource
    to = aws_instance.my_instance
}
# after above step goto terminal and execute : terraform plan -generate-config-out=generated_resources.tf
# above command will generate config file with all resources and their details
#  now goto generated_resources.tf and copy whole code into this main.tf file and then
# we can delete generated_resources.tf file after this
# Also comment or remove import command.Even at this time if we say terraform plan then it treats that a new instance is definied for creation(which is not correct)
# Then run below import command
#terraform import aws_instance.my_instance i-012xyz   # here i-012xyz is the instance id from console
# Above command will import that instance into terraform state file
# then if you run terraform apply - this will show 0 resource create/modify/delete 
#
#
