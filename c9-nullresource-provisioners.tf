# Create a Null resource and provisioners
resource "null_resource" "name" {
    depends_on = [module.ec2_public]
## Connection block for provisioners to connect to EC2 instances
connection {
    type     = "ssh"
    host     = aws_eip.bastion_eip.public_ip
    user     ="ec2-user"
    password = ""
    private_key = file("private-key/Terraform-key1.pem")
  }

## File Provisioner: copies the terraform-key.pem file to /tmp/terraform.pem
 provisioner "file" {
    source      = "private-key/Terraform-key1.pem"
    destination = "/tmp/Terraform-key1.pem"
  }
## Remote Exec provisioner: Using remote-exec provisoner fix the private key permisssions
provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "sudo chmod 400 /tmp/Terraform-key1.pem"
    ]
  }
## Local exec provisioner: local-exec provisoner(creation-time provisoner  - Triggered during)
provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
}
## Local exec provisioner: local-exec provisoner(destroy-time provisoner  - Triggered during deletion of resources)
/*provisioner "local-exec" {
    command = "echo Destroy time prove `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
    #on_failure = continue
}
*/


#creation time provisioners- By default they are created during resource creations (terraform apply)
#destroy time provisioners - Will be executed during terraform destroy command (when = destroy)
}
