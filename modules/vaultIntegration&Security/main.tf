provider "aws" {
  region = "us-east-1"
}
#Before running Vault , data and tags(in ec2) we have to create vault instance as per vault-integration.md 
provider "vault" {
  address = "http://54.237.150.10:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "ad22efcb-4d37-9b44-eeec-fd3deef62b31"
      secret_id = "9bf58be9-de22-77ab-d571-54297b406103"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "example" {
ami = "ami-0005e0cfe09cc9050"
instance_type =  "t2.micro"
tags = {
  secret = data.vault_kv_secret_v2.example.data["username"]
}
}