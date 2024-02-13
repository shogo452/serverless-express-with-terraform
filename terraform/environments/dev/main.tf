module "vpc" {
  source                       = "../../modules/vpc"
  vpc_name                     = "sample-vpc"
  vpc_cidr_block               = "172.18.0.0/16"
  public_subnet_1a_name        = "sample-dev-subnet-public-1a"
  public_subnet_1a_cidr_block  = "172.18.0.0/24"
  public_subnet_1c_name        = "sample-dev-subnet-public-1c"
  public_subnet_1c_cidr_block  = "172.18.2.0/24"
  private_subnet_1a_name       = "sample-dev-subnet-private-1a"
  private_subnet_1a_cidr_block = "172.18.1.0/24"
  private_subnet_1c_name       = "sample-dev-subnet-private-1c"
  private_subnet_1c_cidr_block = "172.18.3.0/24"
  private_subnet_1d_name       = "sample-dev-subnet-private-1d"
  private_subnet_1d_cidr_block = "172.18.5.0/24"
  internet_gateway_name        = "sample-dev-igw"
  allow_ssh_cidr_blocks        = ["0.0.0.0/0"] # Please specify a specific IP address.
}

module "ec2" {
  source                      = "../../modules/ec2"
  key_pair_name               = "sample-dev-key-pair"
  ami_ssm_parameter_name      = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type               = "t2.micro"
  availability_zone           = "ap-northeast-1a"
  public_subnet_1a_id         = module.vpc.public_subnet_1a_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.vpc.ssh_security_group_id]
  disable_api_termination     = true
  ebs_volume_name             = "sample-dev"
  instance_name               = "sample-dev"
}

module "rds" {
  source                                = "../../modules/rds/writer"
  secret_id                             = "sample-dev-rds-secret"
  private_subnet_1a_id                  = module.vpc.private_subnet_1a_id
  private_subnet_1c_id                  = module.vpc.private_subnet_1c_id
  cluster_identifier                    = "sample-dev-rds-cluster"
  instance_identifier                   = "sample-dev-rds-instance-primary"
  engine                                = "aurora-mysql"
  engine_version                        = "8.0.mysql_aurora.3.04.1"
  engine_mode                           = "provisioned"
  ca_cert_identifier                    = "rds-ca-rsa2048-g1"
  cluster_parameter_group_name          = "sample-dev-rds-cluster-parameter-group"
  cluster_parameter_group_family        = "aurora-mysql8.0"
  db_parameter_group_name               = "sample-dev-rds-db-parameter-group"
  db_parameter_group_family             = "aurora-mysql8.0"
  db_subnet_group_name                  = "sample-dev-rds-subnet-group"
  vpc_security_group_ids                = [module.vpc.rds_security_group_id]
  backup_retention_period               = 7
  max_capacity                          = 8
  min_capacity                          = 0.5
  performance_insights_retention_period = 7
  preferred_backup_window               = "17:00-17:30"         # UTC
  preferred_maintenance_window          = "sat:16:00-sat:16:30" # UTC
  monitoring_role_name                  = "sample-dev-rds-enhanced-monitoring-role"
  monitoring_interval                   = 5
}

module "route53" {
  source                      = "../../modules/route53"
  zone_name                   = "serverless-express-with-terraform.local"
  comment                     = "Local alias zone for sample-dev"
  vpc_id                      = module.vpc.vpc_id
  rds_main_host_alias_name    = "main.rds.sample-dev"
  rds_writer_endpoint         = module.rds.writer_endpoint
  rds_replica_host_alias_name = "replica.rds.sample-dev"
  rds_reader_endpoint         = module.rds.reader_endpoint
  elasticache_primary_host_alias_name = "primary.elasticache.sample-dev"
  elasticache_primary_endpoint        = module.elasticache.primary_endpoint
  elasticache_reader_host_alias_name  = "reader.elasticache.sample-dev"
  elasticache_reader_endpoint         = module.elasticache.reader_endpoint
}

module "s3" {
  source      = "../../modules/s3/object"
  bucket_name = "sample-api-lambda-source"
  key         = "dev/latest.zip"
}

module "lambda" {
  source                = "../../modules/lambda"
  role_name             = "sample-api-dev-lambda-role"
  function_name         = "sample-api-dev"
  handler               = "index.js"
  architectures         = ["arm64"]
  runtime               = "nodejs18.x"
  timeout               = 60
  publish               = true
  s3_bucket_name        = "sample-api-lambda-source"
  s3_object_key         = "dev/latest.zip"
  source_code_hash      = module.s3.etag
  node_env              = "dev"
  log_retention_in_days = 1827
  secret_id             = "sample-dev-rds-secret"
  rds_host              = module.rds.writer_endpoint
  private_subnet_ids    = [module.vpc.private_subnet_1d_id]
  security_group_ids    = [module.vpc.lambda_security_group_id]
}

module "api_gateway" {
  source                = "../../modules/api_gateway"
  api_name              = "sample-api-dev"
  api_description       = "sample-api-dev"
  role_name             = "sample-api-dev-api-gateway-role"
  log_retention_in_days = 1827
  lambda_invoke_arn     = module.lambda.invoke_arn
  stage_name            = "dev"
  lambda_function_name  = module.lambda.function_name
  api_key_name          = "sample-api-dev-key"
  secret_id             = "sample-dev-api-gateway-secret"
  credential_key        = "dev_api_key"
  usage_plan_name       = "sample-api-dev-usage-plan"
}

module "elasticache" {
  source                     = "../../modules/elasticache"
  subnet_group_name          = "sample-dev-redis-cluster-subnet-group"
  private_subnet_1a_id       = module.vpc.private_subnet_1a_id
  private_subnet_1c_id       = module.vpc.private_subnet_1c_id
  automatic_failover_enabled = true
  engine_version             = "7.0"
  maintenance_window         = "sat:16:00-sat:17:00" # UTC
  multi_az_enabled           = false
  snapshot_retention_limit   = 7
  snapshot_window            = "17:00-18:00" # UTC
  replication_group_id       = "sample-dev-redis-cluster"
  description                = "sample-dev-redis-cluster"
  node_type                  = "cache.t4g.small"
  num_cache_clusters         = 2
  security_group_ids         = [module.vpc.elasticache_security_group_id]
}
