reusable modules

terraform builtin functions used in this. these two are used in sync
1.  lookup(var.instance_type, terraform.workspace,"t2.micro")
2. type = map(string)
  default = {
    "dev" = "t2.micro"
    "stage" = "t2.small"
    "prod" = "t2.large"
}