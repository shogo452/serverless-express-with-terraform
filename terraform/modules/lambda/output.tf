output "function_name" {
  description = "value of the function name"
  value       = aws_lambda_function.main.function_name
}

output "invoke_arn" {
  description = "value of the invoke ARN"
  value       = aws_lambda_function.main.invoke_arn
}
