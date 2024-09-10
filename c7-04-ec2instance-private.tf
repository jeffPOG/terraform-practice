module "ec2-private" {
    depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.1"
  # insert the 10 required variables here
  name                   ="${var.environment}-private vm"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  #subnet_ids = [
    #module.vpc.private_subnets[0], 
    #module.vpc.private_subnets[1],]
  #instance_count         = var.private_instance_count
  user_data = file("${path.module}/app1-install.sh")
   tags = local.common_tags
   for_each = toset(["0", "1"])
   subnet_id = element(module.vpc.private_subnets, tonumber(each.key))
}

