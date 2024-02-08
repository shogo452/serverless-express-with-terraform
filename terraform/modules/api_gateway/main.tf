resource "aws_api_gateway_rest_api" "main" {
  name        = var.api_name
  description = var.api_description
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_method" "root" {
  rest_api_id      = aws_api_gateway_rest_api.main.id
  resource_id      = aws_api_gateway_rest_api.main.root_resource_id
  http_method      = "ANY"
  authorization    = "NONE"
  api_key_required = true
}

resource "aws_api_gateway_resource" "main" {
  path_part   = "{proxy+}"
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.main.id
}

resource "aws_api_gateway_method" "any" {
  rest_api_id      = aws_api_gateway_rest_api.main.id
  resource_id      = aws_api_gateway_resource.main.id
  http_method      = "ANY"
  authorization    = "NONE"
  api_key_required = true
}

resource "aws_api_gateway_integration" "any" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_resource.main.id
  http_method = aws_api_gateway_method.any.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_api_gateway_integration" "root" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  resource_id = aws_api_gateway_rest_api.main.root_resource_id
  http_method = aws_api_gateway_method.root.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_api_gateway_deployment" "main" {
  depends_on = [aws_api_gateway_integration.any]

  rest_api_id = aws_api_gateway_rest_api.main.id

  triggers = {
    redeployment = sha1(jsonencode([
      aws_api_gateway_method.root.id,
      aws_api_gateway_integration.root.id,
      aws_api_gateway_method.any.id,
      aws_api_gateway_integration.any.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_method_settings" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  method_path = "*/*"
  stage_name  = aws_api_gateway_stage.main.stage_name

  settings {
    logging_level      = "INFO"
    metrics_enabled    = true
    data_trace_enabled = true
  }
}

resource "aws_cloudwatch_log_group" "main" {
  name              = "/aws/api-gateway/access_log/${var.api_name}"
  retention_in_days = var.log_retention_in_days
}

resource "aws_api_gateway_stage" "main" {
  depends_on           = [aws_cloudwatch_log_group.main]
  deployment_id        = aws_api_gateway_deployment.main.id
  rest_api_id          = aws_api_gateway_rest_api.main.id
  stage_name           = var.stage_name
  xray_tracing_enabled = true
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.main.arn
    format          = "{\"requestId\":\"$context.requestId\", \"extendedRequestId\":\"$context.extendedRequestId\", \"ip\": \"$context.identity.sourceIp\", \"caller\":\"$context.identity.caller\", \"user\":\"$context.identity.user\", \"requestTime\":\"$context.requestTime\", \"httpMethod\":\"$context.httpMethod\", \"resourcePath\":\"$context.resourcePath\", \"status\":\"$context.status\", \"protocol\":\"$context.protocol\", \"responseLength\":\"$context.responseLength\"}"
  }
}

resource "aws_api_gateway_rest_api_policy" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  policy      = data.aws_iam_policy_document.main.json
}

data "aws_iam_policy_document" "main" {
  statement {
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "execute-api:Invoke"
    ]

    resources = [
      "${aws_api_gateway_stage.main.execution_arn}/*"
    ]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "main" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "allow_to_logging" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
}

resource "aws_lambda_permission" "main" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_stage.main.execution_arn}/*"
}

data "aws_secretsmanager_secret_version" "main" {
  secret_id = var.secret_id
}

locals {
  credentials = jsondecode(data.aws_secretsmanager_secret_version.main.secret_string)
}

resource "aws_api_gateway_api_key" "main" {
  name  = var.api_key_name
  value = local.credentials[var.credential_key]
}

resource "aws_api_gateway_usage_plan" "main" {
  depends_on = [aws_api_gateway_deployment.main]

  name = var.usage_plan_name
  api_stages {
    api_id = aws_api_gateway_rest_api.main.id
    stage  = aws_api_gateway_stage.main.stage_name
  }
}

resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.main.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.main.id
}
