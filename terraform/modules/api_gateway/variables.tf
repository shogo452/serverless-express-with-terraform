variable "api_name" {
  description = "value of the API name"
  type        = string
}

variable "api_description" {
  description = "value of the API description"
  type        = string
}

variable "role_name" {
  description = "value of the role name"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "value of the Lambda invoke ARN"
  type        = string
}

variable "stage_name" {
  description = "value of the stage name"
  type        = string
}

variable "log_retention_in_days" {
  description = "value of the log retention in days"
  type        = number
}

variable "lambda_function_name" {
  description = "value of the function name"
  type        = string
}

variable "api_key_name" {
  description = "value of the API key name"
  type        = string
}

variable "secret_id" {
  description = "value of the secret ID"
  type        = string
}

variable "credential_key" {
  description = "value of the credential key"
  type        = string
}

variable "usage_plan_name" {
  description = "value of the usage plan"
  type        = string
}
