variable "instance_type_maps" {
  type = map(string)
  default = {
    "development" = "t3.micro"
    "test"        = "t3.small"
    "production"  = "t3.large"
  }
}
