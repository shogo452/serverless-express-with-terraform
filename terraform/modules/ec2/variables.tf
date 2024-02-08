variable "key_pair_name" {
  description = "value of the key pair name"
  type        = string
}

variable "ami_ssm_parameter_name" {
  description = "value of the AMI SSM parameter name"
  type        = string
}

variable "instance_type" {
  description = "value of the instance type"
  type        = string
}

variable "availability_zone" {
  description = "value of the availability zone"
  type        = string
}

variable "public_subnet_1a_id" {
  description = "value of the public subnet 1a ID"
  type        = string
}

variable "associate_public_ip_address" {
  description = "value of the associate public IP address"
  type        = bool
}

variable "vpc_security_group_ids" {
  description = "value of the VPC security group IDs"
  type        = list(string)
}

variable "disable_api_termination" {
  description = "value of the disable API termination"
  type        = bool
}

variable "ebs_volume_name" {
  description = "value of the EBS volume name"
  type        = string
}

variable "instance_name" {
  description = "value of the instance name"
  type        = string
}
