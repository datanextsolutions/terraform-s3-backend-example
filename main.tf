provider "aws" {
  region = "us-east-1"

  # Optionally add your access and secret keys here
  # access_key = "ACCESS_KEY_HERE"
  # secret_key = "SECRET_KEY_HERE"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}

#backend make sure to change bucket name 
terraform {
  backend "s3" {
    bucket = "datanextapps"
    key    = "terraform/dev/terraform_dev.tfstate"
    region = "us-east-1"

    # while working in team locking is important
    # use your table name
    dynamodb_table = "terraform_remote_locks"
    encrypt        = true
  }
}
