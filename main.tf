# Required providers block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider to a region
provider "aws" {
  region = var.aws_region
}

# here I am creating an ec2 instance using the resource block
resource "aws_instance" "Nextgen" {
  ami           = "ami-0230bd60aa48260c6" # Amazon Linux in us-east-1, update as per your region
  instance_type = var.instance_type_map["development"]
  key_name      = "Nextgen"
  tags = {
    Name = "Nextgen"
  }
}
