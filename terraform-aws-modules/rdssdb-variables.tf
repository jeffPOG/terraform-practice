# RDS Variables
variable "db_name" {
  description = "The name of the database to create when the DB instance is created."
  type        = string
  default     = "mydb"
}
variable "db_engine" {
  description = "The name of the database engine to be used for this DB instance."
  type        = string
  default     = "mysql"
}
variable "db_engine_version" {
  description = "The version number of the database engine to use."
  type        = string
  default     = "8.0.39"
}
variable "db_instance_class" {
  description = "The compute and memory capacity of the DB instance."
  type        = string
  default     = "db.t3.medium"
}

variable "db_username" {
  description = "The name of master user for the client DB instance."
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The password for the master database user."
  type        = string
  default     = "password"
}

