# --------------------------------------------------
# Network
# --------------------------------------------------
resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = [var.private_subnet_1a_id, var.private_subnet_1c_id]
}

# --------------------------------------------------
# Parameter Group
# --------------------------------------------------
resource "aws_rds_cluster_parameter_group" "main" {
  name   = var.cluster_parameter_group_name
  family = var.cluster_parameter_group_family

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }
}

resource "aws_db_parameter_group" "main" {
  name   = var.db_parameter_group_name
  family = var.db_parameter_group_family
}

# --------------------------------------------------
# Cluster
# --------------------------------------------------`
data "aws_secretsmanager_secret_version" "main" {
  secret_id = var.secret_id
}

locals {
  credentials = jsondecode(data.aws_secretsmanager_secret_version.main.secret_string)
}

resource "aws_rds_cluster" "main" {
  cluster_identifier              = var.cluster_identifier
  engine                          = var.engine
  engine_version                  = var.engine_version
  engine_mode                     = var.engine_mode
  master_username                 = local.credentials.master_username
  master_password                 = local.credentials.master_password
  port                            = local.credentials.port
  database_name                   = local.credentials.database_name
  vpc_security_group_ids          = var.vpc_security_group_ids
  db_subnet_group_name            = aws_db_subnet_group.main.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.main.name
  skip_final_snapshot             = true
  allow_major_version_upgrade     = true
  deletion_protection             = false
  backup_retention_period         = var.backup_retention_period
  preferred_maintenance_window    = var.preferred_maintenance_window
  storage_encrypted               = true
  kms_key_id                      = local.credentials.kms_key_id
  copy_tags_to_snapshot           = true
  preferred_backup_window         = var.preferred_backup_window
  enabled_cloudwatch_logs_exports = [
    "audit"
  ]
  serverlessv2_scaling_configuration {
    max_capacity = var.max_capacity
    min_capacity = var.min_capacity
  }
}

# --------------------------------------------------
# Writer Instance
# --------------------------------------------------
resource "aws_rds_cluster_instance" "main" {
  identifier                            = var.instance_identifier
  cluster_identifier                    = aws_rds_cluster.main.id
  engine                                = var.engine
  engine_version                        = var.engine_version
  instance_class                        = "db.serverless"
  ca_cert_identifier                    = var.ca_cert_identifier
  db_subnet_group_name                  = aws_db_subnet_group.main.name
  db_parameter_group_name               = aws_db_parameter_group.main.name
  publicly_accessible                   = false
  performance_insights_enabled          = true
  performance_insights_retention_period = var.performance_insights_retention_period
  performance_insights_kms_key_id       = local.credentials.kms_key_id
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = aws_iam_role.enhanced_monitoring.arn
}

# --------------------------------------------------
# Monitoring Role
# --------------------------------------------------
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "enhanced_monitoring" {
  name               = var.monitoring_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "allow_to_connect_to_rds" {
  role       = aws_iam_role.enhanced_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}
