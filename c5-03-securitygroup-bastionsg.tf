# AWS EC2 security group terraforn module
# security group for public bastion host
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name = "public-bastion-sg"
  description = "security group with SSH port open for everybody (IPv4 CIDR), egress ports are all open world"
  vpc_id = module.vpc.vpc_id
  # ingress rules & CIDR blocks
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags
}

