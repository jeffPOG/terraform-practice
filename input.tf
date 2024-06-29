variable "aws_region" {
  description = "region for east coast deployment"
  type        = string
  default     = "us-east-1"
}

# variable "instance_type_list" {
#   description = "list that specifies instance types"
#   type        = list(string)
#   default     = ["t2.micro", "t3.small", "t3.medium", "g5.12xlarge"]
# }

variable "instance_type_map" {
  description = "a map for instances types in each environment"
  type        = map(string)
  default = {
    "development" = "t3.micro"
    "test"        = "t3.small"
    "Production"  = "t3.medium"
  }
}
