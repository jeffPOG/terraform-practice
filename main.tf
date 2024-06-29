# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
}

# Resource Block # AWS EC2 Instance Type - Map
resource "aws_instance" "ec2demo" {
  ami           = "ami-0be2609ba883822ec" # Amazon Linux in us-east-1, update as per your region
  instance_type = var.instance_type_map["dev"]
}