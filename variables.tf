# #ANYTHING THAT CAN BE CHANGED OR NEED MULTIPLE OPTIONS OF THE SAME THING, USE VARIABLES

# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type        = string
  default     = "makeys"
}

# AWS EC2 Instance Type - List
variable "instance_type_list" {
  description = "EC2 Instance Type List"
  type        = list(string)
  default     = ["t3.micro", "t3.small", "t3.large"] # list is 0 (t3.micro), 1 (small), 2 (large)
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instance Type Map"
  type        = map(string)
  default = {
    "Dev"  = "t3.micro"
    "Test" = "t3.small"
    "Prod" = "t3.large"
  }
}
