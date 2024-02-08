variable "vpc_name" {
  description = "value of the VPC name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "value of the VPC CIDR block"
  type        = string
}

variable "public_subnet_1a_name" {
  description = "value of the public subnet 1a name"
  type        = string
}

variable "public_subnet_1a_cidr_block" {
  description = "value of the public subnet 1a CIDR block"
  type        = string
}

variable "public_subnet_1c_name" {
  description = "value of the public subnet 1c name"
  type        = string
}

variable "public_subnet_1c_cidr_block" {
  description = "value of the public subnet 1c CIDR block"
  type        = string
}

variable "private_subnet_1a_name" {
  description = "value of the private subnet 1a name"
  type        = string
}

variable "private_subnet_1a_cidr_block" {
  description = "value of the private subnet 1a CIDR block"
  type        = string
}

variable "private_subnet_1c_name" {
  description = "value of the private subnet 1c name"
  type        = string
}

variable "private_subnet_1c_cidr_block" {
  description = "value of the private subnet 1c CIDR block"
  type        = string
}

variable "private_subnet_1d_name" {
  description = "value of the private subnet 1d name"
  type        = string
}

variable "private_subnet_1d_cidr_block" {
  description = "value of the private subnet 1d CIDR block"
  type        = string
}

variable "internet_gateway_name" {
  description = "value of the internet gateway name"
  type        = string
}

variable "allow_ssh_cidr_blocks" {
  description = "value of the CIDR blocks to allow SSH access"
  type        = list(string)
}
