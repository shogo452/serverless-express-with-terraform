output "subnet_group_name" {
  description = "value of the subnet group name"
  value       = aws_db_subnet_group.main.name
}

output "cluster_parameter_group_name" {
  description = "value of the cluster parameter group name"
  value       = aws_rds_cluster_parameter_group.main.name
}

output "db_parameter_group_name" {
  description = "value of the DB parameter group name"
  value       = aws_db_parameter_group.main.name
}

output "writer_endpoint" {
  description = "value of the DB writer instance endpoint"
  value       = aws_rds_cluster.main.endpoint
}

output "reader_endpoint" {
  description = "value of the DB reader instance endpoint"
  value       = aws_rds_cluster.main.reader_endpoint
}
