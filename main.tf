# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"

    }
  }
}

# Configure aws providers to a region
provider "aws" {
  region = "us-east-1"
}

# Ec2 aws instance
resource "aws_instance" "briannaserver" {
  ami           = "ami-0230bd60aa48260c6"
  instance_type = var.instance_type_maps["development"]
}
hello world