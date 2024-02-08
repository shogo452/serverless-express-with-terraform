data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "main" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "allow_to_logging" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "allow_to_connect_to_rds" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_in_days
}

data "aws_secretsmanager_secret_version" "main" {
  secret_id = var.secret_id
}

locals {
  credentials = jsondecode(data.aws_secretsmanager_secret_version.main.secret_string)
}

resource "aws_lambda_function" "main" {
  function_name    = var.function_name
  role             = aws_iam_role.main.arn
  handler          = var.handler
  architectures    = var.architectures
  runtime          = var.runtime
  timeout          = var.timeout
  s3_bucket        = var.s3_bucket_name
  s3_key           = var.s3_object_key
  source_code_hash = var.source_code_hash
  environment {
    variables = {
      NODE_ENV     = var.node_env
      RDS_HOST     = var.rds_host
      RDS_USERNAME = local.credentials.master_username
      RDS_PASSWORD = local.credentials.master_password
      RDS_DATABASE = local.credentials.database_name
    }
  }
  vpc_config {
    subnet_ids         = var.private_subnet_ids
    security_group_ids = var.security_group_ids
  }

  lifecycle {
    ignore_changes = [source_code_hash]
  }
}
