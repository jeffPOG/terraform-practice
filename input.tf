variable "aws_region" {
  description = "region for east coast deployment"
  type        = string
  default     = "us-east-1"
}

variable "aws_west_region" {
  description = "region for west coast deployment"
  type        = string
  default     = "us-west-1"
}

variable "instance_type_list" {
  description = "list that specifies instance types"
  type = list(string)
  default = [ "t2.micro", "t3.small", "t3.medium", "g5.12xlarge" ]
}
