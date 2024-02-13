# --------------------------------------------------
# Network
# --------------------------------------------------
resource "aws_elasticache_subnet_group" "main" {
  name       = var.subnet_group_name
  subnet_ids = [var.private_subnet_1a_id, var.private_subnet_1c_id]
}

# --------------------------------------------------
# Cluster
# --------------------------------------------------
resource "aws_elasticache_replication_group" "main" {
  automatic_failover_enabled  = var.automatic_failover_enabled
  engine_version              = var.engine_version
  at_rest_encryption_enabled  = true
  maintenance_window          = var.maintenance_window
  multi_az_enabled            = var.multi_az_enabled
  snapshot_retention_limit    = var.snapshot_retention_limit
  snapshot_window             = var.snapshot_window
  preferred_cache_cluster_azs = ["ap-northeast-1a", "ap-northeast-1c"]
  replication_group_id        = var.replication_group_id
  description                 = var.description
  node_type                   = var.node_type
  num_cache_clusters          = var.num_cache_clusters
  port                        = 6379
  subnet_group_name           = aws_elasticache_subnet_group.main.name
  security_group_ids          = var.security_group_ids
  # TODO: log_delivery_configuration
}
