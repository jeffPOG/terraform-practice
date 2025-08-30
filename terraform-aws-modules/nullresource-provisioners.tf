resource "null_resource" "name" {
  # Store the public IP in a local variable or trigger to use in both provisioners
  triggers = {
    public_ip = aws_eip.bastion_eip.public_ip
    user = "ec2-user"
    private_key_path = "private-key/Nextgen.pem"
  }

  # Copies the Nextgen.pem file to /tmp/Nextgen.pem
  provisioner "file" {
    source      = "private-key/Nextgen.pem"
    destination = "/tmp/Nextgen.pem"
    
    connection {
      type        = "ssh"
      host        = aws_eip.bastion_eip.public_ip
      user        = "ec2-user"
      private_key = file("private-key/Nextgen.pem")
    }
  }  

  # Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/Nextgen.pem"
    ]
    
    connection {
      type        = "ssh"
      host        = aws_eip.bastion_eip.public_ip
      user        = "ec2-user"
      private_key = file("private-key/Nextgen.pem")
    }
  }  
  
  # local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  provisioner "local-exec" {
    command = "echo VPC created on `date` and VPC ID: ${module.nextgen_vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    #on_failure = continue
  }
  
  # Remote exec for create-time logging
  provisioner "remote-exec" {
    inline = [
      "echo VPC created on `date` and VPC ID: ${module.nextgen_vpc.vpc_id} >> creation-time-vpc-id.txt"
    ]
    
    connection {
      type        = "ssh"
      host        = aws_eip.bastion_eip.public_ip
      user        = "ec2-user"
      private_key = file("private-key/Nextgen.pem")
    }
  }

  provisioner "remote-exec" {
  when = destroy
  inline = [
    "echo Destroy time prov `date` >> destroy-time-prov.txt"
  ]
  
  connection {
    type        = "ssh"
    host        = self.triggers.public_ip
    user        = self.triggers.user
    private_key = file(self.triggers.private_key_path)
    timeout     = "1m"
  }
  on_failure = continue
}
}