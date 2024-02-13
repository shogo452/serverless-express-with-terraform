output "primary_endpoint" {
  description = "value of the DB writer instance endpoint"
  value       = aws_elasticache_replication_group.main.primary_endpoint_address
}

output "reader_endpoint" {
  description = "value of the DB reader instance endpoint"
  value       = aws_elasticache_replication_group.main.reader_endpoint_address
}
