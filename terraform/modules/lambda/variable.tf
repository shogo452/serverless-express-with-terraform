variable "role_name" {
  description = "value of the role name"
  type        = string
}

variable "function_name" {
  description = "value of the function name"
  type        = string
}

variable "handler" {
  description = "value of the handler"
  type        = string
}

variable "architectures" {
  description = "value of the architectures"
  type        = list(string)
}

variable "runtime" {
  description = "value of the runtime"
  type        = string
}

variable "timeout" {
  description = "value of the timeout"
  type        = number
}

variable "publish" {
  description = "value of the publish"
  type        = bool
}

variable "s3_bucket_name" {
  description = "value of the s3 bucket name"
  type        = string
}

variable "s3_object_key" {
  description = "value of the s3 object key"
  type        = string
}

variable "source_code_hash" {
  description = "value of the source code hash"
  type        = string
}

variable "node_env" {
  description = "value of the node env"
  type        = string
}

variable "log_retention_in_days" {
  description = "value of the log retention in days"
  type        = number
}

variable "secret_id" {
  description = "value of the secret id"
  type        = string
}

variable "rds_host" {
  description = "value of the rds host"
  type        = string
}

variable "private_subnet_ids" {
  description = "value of the private subnet ids"
  type        = list(string)
}

variable "security_group_ids" {
  description = "value of the security group ids"
  type        = list(string)
}
