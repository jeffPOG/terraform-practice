terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  # Configuration options
}


resource "aws_vpc" "aws" {
  cidr_block = "10.0.0.0/16"
}

# create ec2 instance
resource "aws_instance" "app1" {
  ami = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  
}