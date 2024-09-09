# AWS EC2 security group terraform module
# Security group for Private EC2 instnaces
module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name = "private-sg"
  description = "security group with HTTP & SSH port open for entire VPC block (IPv4 CIDR), egress ports are all open world"
  vpc_id = module.vpc.vpc_id
  # ingress rules & CIDR blocks
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  # Egress rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags
}
