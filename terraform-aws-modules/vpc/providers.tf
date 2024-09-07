# Terraform Block
terraform {
  required_version = "~> 0.12"
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = ">= 2.0.0"
        }
    }
}

# Provider Block
provider "aws" {
  region = "us-east-1"
}