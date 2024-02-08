output "invoke_url" {
  description = "value of the invoke URL"
  value       = aws_api_gateway_deployment.main.invoke_url
}

output "log_group_name" {
  description = "value of the log group name"
  value       = "API-Gateway-Execution-Logs_${aws_api_gateway_rest_api.main.id}/${var.stage_name}"
}
