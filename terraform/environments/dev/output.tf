output "vpc_id" {
  description = "value of the VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_public_subnet_1a_id" {
  description = "value of the public subnet 1a ID"
  value       = module.vpc.public_subnet_1a_id
}

output "vpc_public_subnet_1a_cidr_block" {
  description = "value of the public subnet 1a CIDR block"
  value       = module.vpc.public_subnet_1a_cidr_block
}

output "vpc_public_subnet_1c_id" {
  description = "value of the public subnet 1c ID"
  value       = module.vpc.public_subnet_1c_id
}

output "vpc_public_subnet_1c_cidr_block" {
  description = "value of the public subnet 1c CIDR block"
  value       = module.vpc.public_subnet_1c_cidr_block
}

output "vpc_private_subnet_1a_id" {
  description = "value of the private subnet 1a ID"
  value       = module.vpc.private_subnet_1a_id
}

output "vpc_private_subnet_1c_id" {
  description = "value of the private subnet 1c ID"
  value       = module.vpc.private_subnet_1c_id
}

output "vpc_private_subnet_1d_id" {
  description = "value of the private subnet 1d ID"
  value       = module.vpc.private_subnet_1d_id
}

output "vpc_internet_gateway_id" {
  description = "value of the internet gateway ID"
  value       = module.vpc.internet_gateway_id
}

output "vpc_ssh_security_group_id" {
  description = "value of the ssh security group ID"
  value       = module.vpc.ssh_security_group_id
}

output "vpc_rds_security_group_id" {
  description = "value of the rds security group ID"
  value       = module.vpc.rds_security_group_id
}

output "vpc_lambda_security_group_id" {
  description = "value of the lambda security group ID"
  value       = module.vpc.lambda_security_group_id
}

output "vpc_elasticache_security_group_id" {
  description = "value of the rds security group ID"
  value       = module.vpc.rds_security_group_id
}

output "ec2_instance_id" {
  description = "value of the EC2 instance ID"
  value       = module.ec2.instance_id
}

output "ec2_instance_public_ip" {
  description = "value of the EC2 instance public IP"
  value       = module.ec2.instance_public_ip
}

output "ec2_root_block_device_volume_id" {
  description = "value of the EC2 root block device volume ID"
  value       = module.ec2.root_block_device_volume_id
}

output "rds_writer_endpoint" {
  description = "value of the RDS writer instance endpoint"
  value       = module.rds.writer_endpoint
}

output "rds_reader_endpoint" {
  description = "value of the RDS reader instance endpoint"
  value       = module.rds.reader_endpoint
}

output "lambda_function_name" {
  description = "value of the function name"
  value       = module.lambda.function_name
}

output "lambda_invoke_arn" {
  description = "value of the invoke ARN"
  value       = module.lambda.invoke_arn
}

output "api_gateway_invoke_url" {
  description = "value of the API Gateway invoke URL"
  value       = module.api_gateway.invoke_url
}

output "api_gateway_log_group_name" {
  description = "value of the API Gateway log group name"
  value       = module.api_gateway.log_group_name
}

output "elasticahce_primary_endpoint" {
  description = "value of the Elasticahce primary instance endpoint"
  value       = module.elasticache.primary_endpoint
}

output "elasticache_reader_endpoint" {
  description = "value of the RDS reader instance endpoint"
  value       = module.elasticache.reader_endpoint
}
