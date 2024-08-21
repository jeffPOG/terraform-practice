# AWS region
variable "aws_region" {
    description = "Region in which AWS resources to be created"
    type = string 
    default = "us-east-1"
}

# Environment variable
variable "environment" {
    description = "Environment variable used as a prefix"
    type = string
    default = "dev"
}

# Business Division
variable "business_division" {
    description = "Business division in the large organization"
    type = string 
    default = "HR"
}