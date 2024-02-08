variable "bucket_name" {
  description = "the name of the bucket"
  type        = string
}

variable "acl" {
  description = "value of the acl"
  type        = string
  default     = "true"
}

variable "versioning_status" {
  description = "value of the versioning status"
  type        = string
  default     = "Enabled"
}
