variable "automatic_failover_enabled" {
  description = "Enable automatic failover"
  type        = bool
}

variable "engine_version" {
  description = "Version of the ElastiCache engine"
  type        = string
}

variable "maintenance_window" {
  description = "Maintenance window of the ElastiCache cluster"
  type        = string
}

variable "multi_az_enabled" {
  description = "Enable multi-AZ"
  type        = bool
}

variable "snapshot_retention_limit" {
  description = "Number of days to retain ElastiCache snapshots"
  type        = number
}

variable "snapshot_window" {
  description = "Time window to take ElastiCache snapshots"
  type        = string
}

variable "subnet_group_name" {
  description = "Name of the ElastiCache subnet group"
  type        = string
}

variable "private_subnet_1a_id" {
  description = "ID of the private subnet 1a"
  type        = string
}

variable "private_subnet_1c_id" {
  description = "ID of the private subnet 1c"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "replication_group_id" {
  description = "ID of the ElastiCache replication group"
  type        = string
}

variable "description" {
  description = "Description of the ElastiCache cluster"
  type        = string
}

variable "node_type" {
  description = "Type of the ElastiCache node"
  type        = string
}

variable "num_cache_clusters" {
  description = "Number of ElastiCache nodes"
  type        = number
}
