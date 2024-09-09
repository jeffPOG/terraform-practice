# create elastic IP for Bastion Host
# Resource - depends_on Meta-Argument

resource "aws_eip" "bastion_eip" {

  depends_on = [ module.ec2_public, module.vpc ] 
  instance = module.ec2_public.id
  domain   = "vpc"
  tags = local.common_tags
  

  # local exec provisioner: local-ecex provisioner (Destroy-Time)
  provisioner "local-exec" {
    command = "echo destroy time `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
    
  }
}