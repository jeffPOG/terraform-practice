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