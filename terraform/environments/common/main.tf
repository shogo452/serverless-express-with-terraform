module "s3_bucket" {
  source            = "../../modules/s3/bucket"
  bucket_name       = "sample-api-lambda-source"
  acl               = "private"
  versioning_status = "Enabled"
}

module "api_gateway" {
  source    = "../../modules/api_gateway/setting"
  role_name = "api_gateway_cloudwatch_global"
}
