# vpc ID
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.nextgen_vpc.vpc_id
}

# CIDR block of the VPC
output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.nextgen_vpc.vpc_cidr_block
}

# public subnets ID
output "public_subnets" {
  description = "IDs of the public subnets"
  value       = module.nextgen_vpc.public_subnets
}

# private subnets ID
output "private_subnets" {
  description = "IDs of the private subnets"
  value       = module.nextgen_vpc.private_subnets
}

# database subnets ID
output "database_subnets" {
  description = "IDs of the database subnets"
  value       = module.nextgen_vpc.database_subnets
}

# vpc availability zones
output "availability_zones" {
  description = "Availability Zones of the VPC"
  value       = module.nextgen_vpc.azs
}

# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_public.id
}
output "ec2_bastion_public_ip" {
  description = "List of Public ip address assigned to the instances"
  value       = module.ec2_public.public_ip
}
# Private EC2 Instances
output "ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_private.id
}
output "ec2_private_ip" {
  description = "List of private ip address assigned to the instances"
  value       = module.ec2_private.private_ip
}