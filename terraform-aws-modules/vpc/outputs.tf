# vpc ID
output "vpc_id" {
  description = "ID of the VPC"
  value = module.nextgen_vpc.vpc_id
}

# CIDR block of the VPC
output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value = module.nextgen_vpc.vpc_cidr_block
}

# public subnets ID
output "public_subnets" {
  description = "IDs of the public subnets"
  value = module.nextgen_vpc.public_subnets
}

# private subnets ID
output "private_subnets" {
  description = "IDs of the private subnets"
  value = module.nextgen_vpc.private_subnets
}

# database subnets ID
output "database_subnets" {
  description = "IDs of the database subnets"
  value = module.nextgen_vpc.database_subnets
}

# NAT gateway IPs
output "nat_gateway_ips" {
  description = "Public IPs of the NAT Gateways"
  value = module.nextgen_vpc.nat_gateway_public_ips
}

# vpc availability zones
output "availability_zones" {
  description = "Availability Zones of the VPC"
  value = module.nextgen_vpc.azs
}