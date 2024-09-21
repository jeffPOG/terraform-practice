# AWS region to deploy to
variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default = "us-east-1"
}

# Environment to deploy
variable "environment" {
    description = "The environment to deploy"
    type        = string
    default = "dev"
}

# Name of the business unit
variable "business_unit" {
    description = "The name of the business unit"
    type        = string
    default = "cloud"
}