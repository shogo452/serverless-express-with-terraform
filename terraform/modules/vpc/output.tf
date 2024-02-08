output "vpc_id" {
  description = "value of the VPC ID"
  value       = aws_vpc.vpc.id
}

output "public_subnet_1a_id" {
  description = "value of the public subnet 1a ID"
  value       = aws_subnet.public_1a.id
}

output "public_subnet_1a_cidr_block" {
  description = "value of the public subnet 1a CIDR block"
  value       = aws_subnet.public_1a.cidr_block
}

output "public_subnet_1c_id" {
  description = "value of the public subnet 1c ID"
  value       = aws_subnet.public_1c.id
}

output "public_subnet_1c_cidr_block" {
  description = "value of the public subnet 1c CIDR block"
  value       = aws_subnet.public_1c.cidr_block
}

output "private_subnet_1a_id" {
  description = "value of the private subnet 1a ID"
  value       = aws_subnet.private_1a.id
}

output "private_subnet_1c_id" {
  description = "value of the private subnet 1c ID"
  value       = aws_subnet.private_1c.id
}

output "private_subnet_1d_id" {
  description = "value of the private subnet 1d ID"
  value       = aws_subnet.private_1d.id
}
output "internet_gateway_id" {
  description = "value of the internet gateway ID"
  value       = aws_internet_gateway.main.id
}

output "ssh_security_group_id" {
  description = "value of the ssh security group ID"
  value       = aws_security_group.allow_ssh.id
}

output "rds_security_group_id" {
  description = "value of the rds security group ID"
  value       = aws_security_group.rds.id
}

output "lambda_security_group_id" {
  description = "value of the lambda security group ID"
  value       = aws_security_group.lambda.id
}
