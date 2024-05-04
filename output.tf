# Get the ip of the Next ec2 instance
output "NextgenIP" {
  description = "retrieve the public IP of the nextgen ec2 instance"
  value       = aws_instance.Nextgen.public_ip
}