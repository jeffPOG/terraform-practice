# vpc module
module "nextgen_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.70.0"
  name = "nextgen-vpc"
  cidr = "40.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b"]
  # public_subnets
  public_subnets = ["40.0.1.0/24", "40.0.2.0/24"]
  # private_subnets
  enable_nat_gateway = true # Outbound internet access for private subnets
  single_nat_gateway = true
  private_subnets = ["40.0.11.0/24", "40.0.12.0/24"]
  # database_subnets
  create_database_subnet_group = true
  create_database_subnet_route_table = true
  database_subnets = ["40.0.21.0/24", "40.0.22.0/24"]
  # dns_support
  enable_dns_support = true
  enable_dns_hostnames = true
  # tags
  public_subnet_tags = {
    name = "public-subnet"
  }
  private_subnet_tags = {
    name = "private-subnet"
  }
  database_subnet_tags = {
    name = "database-subnet"
  }
  vpc_tags = {
    name = "nextgen-vpc"
  }
}