terraform {
  backend "s3" {
    bucket = "s3bucket-tf2"
    region = "us-east-1"
    key="vsivas/terraform.tfstate"
  }
}