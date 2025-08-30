# RDS Outputs


output "db_instance_arn" {
  value = module.rdssdb.db_instance_arn
}
output "db_instance_status" {
  value = module.rdssdb.db_instance_status
}

output "db_instance_endpoint" {
  value = module.rdssdb.db_instance_endpoint
}
