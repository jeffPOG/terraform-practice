# AWS EC2 Instance Type - List
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = ["t3.micro", "t3.small"]
}


# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instance Type"
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "qa"  = "t3.small"
    "prod" = "t3.large"
  }
}