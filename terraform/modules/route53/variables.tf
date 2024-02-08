variable "zone_name" {
  description = "value of the zone name"
  type        = string
}

variable "comment" {
  description = "value of the comment"
  type        = string
}

variable "vpc_id" {
  description = "value of the vpc id"
  type        = string
}

variable "rds_main_host_alias_name" {
  description = "value of the rds main host alias name"
  type        = string
}

variable "rds_writer_endpoint" {
  description = "value of the rds writer endpoint"
  type        = string
}

variable "rds_replica_host_alias_name" {
  description = "value of the rds replica host alias name"
  type        = string
}

variable "rds_reader_endpoint" {
  description = "value of the rds reader endpoint"
  type        = string
}
