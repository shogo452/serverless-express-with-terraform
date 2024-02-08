variable "db_subnet_group_name" {
  description = "value of the DB subnet group name"
  type        = string
}

variable "cluster_parameter_group_name" {
  description = "value of the cluster parameter group name"
  type        = string
}

variable "cluster_parameter_group_family" {
  description = "value of the cluster parameter group family"
  type        = string
}

variable "db_parameter_group_name" {
  description = "value of the DB parameter group name"
  type        = string
}

variable "db_parameter_group_family" {
  description = "value of the DB parameter group family"
  type        = string
}

variable "secret_id" {
  description = "value of the secret ID"
  type        = string
}

variable "cluster_identifier" {
  description = "value of the cluster identifier"
  type        = string
}

variable "instance_identifier" {
  description = "value of the instance identifier"
  type        = string
}

variable "engine" {
  description = "value of the engine"
  type        = string
}

variable "engine_version" {
  description = "value of the engine version"
  type        = string
}

variable "engine_mode" {
  description = "value of the engine mode"
  type        = string
}

variable "ca_cert_identifier" {
  description = "value of the CA cert identifier"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "value of the VPC security group IDs"
  type        = list(string)
}

variable "private_subnet_1a_id" {
  description = "value of the private subnet 1a ID"
  type        = string
}

variable "private_subnet_1c_id" {
  description = "value of the private subnet 1c ID"
  type        = string
}

variable "backup_retention_period" {
  description = "value of the backup retention period"
  type        = number
}

variable "preferred_maintenance_window" {
  description = "value of the preferred maintenance window"
  type        = string
}

variable "preferred_backup_window" {
  description = "value of the preferred backup window"
  type        = string
}

variable "monitoring_interval" {
  description = "value of the monitoring interval"
  type        = number
}

variable "monitoring_role_name" {
  description = "value of the monitoring role name"
  type        = string
}

variable "max_capacity" {
  description = "value of the max capacity"
  type        = number
}

variable "min_capacity" {
  description = "value of the min capacity"
  type        = number
}

variable "performance_insights_retention_period" {
  description = "value of the performance insights retention period"
  type        = number
}
