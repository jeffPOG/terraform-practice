# Data source to get the instance type offering for the utility instance
data "aws_ec2_instance_type_offering" "utility-instance" {
  for_each = toset([ "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1f"])
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]
  }
  location_type = "availability-zone"
}


output "instance_type_offering" {
  value = { for az, details in data.aws_ec2_instance_type_offering.utility-instance : az => {
    instance_type = details.instance_type
  }}
}
