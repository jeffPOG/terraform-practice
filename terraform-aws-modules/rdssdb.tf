data "aws_caller_identity" "current" {}
data "aws_iam_role" "rds_monitoring_role" {
  name = "rds-monitoring-role"
}

# Create the RDS DB instance
module "rdssdb" {
  source = "terraform-aws-modules/rds/aws"
  identifier           = var.db_name
  engine              = var.db_engine
  engine_version      = var.db_engine_version
  instance_class      = var.db_instance_class
  manage_master_user_password = false
  username = var.db_username
  password = var.db_password
  port = 3306
  multi_az = true
  create_db_subnet_group = true
  subnet_ids = module.nextgen_vpc.private_subnets
  vpc_security_group_ids = [module.nextgen_vpc.default_security_group_id]
  family = "mysql8.0"
  major_engine_version = "8.0"
  allocated_storage = 20
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window = "03:00-06:00"
  backup_retention_period = 0
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]
  skip_final_snapshot = true
  deletion_protection = false
  performance_insights_enabled = true
  performance_insights_retention_period = 7
  create_monitoring_role = false
  monitoring_role_arn    = data.aws_iam_role.rds_monitoring_role.arn
  monitoring_interval = 60
  parameters = [
    {
      name  = "character_set_server"
      value = "utf8mb4"
    },
    {
      name  = "collation_server"
      value = "utf8mb4_unicode_ci"
    }
  ]
  tags = {
    Name        = "RDS Instance"
    Environment = "Dev"
  }
  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}

resource "aws_security_group_rule" "allow_bastion_to_rds" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = module.nextgen_vpc.default_security_group_id   # <-- RDS SG
  source_security_group_id = module.public_bastion_sg.this_security_group_id
  description              = "Allow bastion to reach RDS"
}




