
# Terraform Output Values
 
# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.Terra1.public_ip
}
 
# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.Terra1.public_dns
}
 
# Keypair
output "instance_keyname" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  value = aws_instance.Terra1.key_name
}