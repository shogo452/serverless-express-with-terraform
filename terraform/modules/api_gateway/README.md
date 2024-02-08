<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_api_key.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_api_key) | resource |
| [aws_api_gateway_deployment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_integration.any](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_integration.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.any](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method_settings.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_settings) | resource |
| [aws_api_gateway_resource.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_rest_api_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api_policy) | resource |
| [aws_api_gateway_usage_plan.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan) | resource |
| [aws_api_gateway_usage_plan_key.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_usage_plan_key) | resource |
| [aws_lambda_permission.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_description"></a> [api\_description](#input\_api\_description) | value of the API description | `string` | n/a | yes |
| <a name="input_api_key_name"></a> [api\_key\_name](#input\_api\_key\_name) | value of the API key name | `string` | n/a | yes |
| <a name="input_api_key_value"></a> [api\_key\_value](#input\_api\_key\_value) | value of the API key value | `string` | n/a | yes |
| <a name="input_api_name"></a> [api\_name](#input\_api\_name) | value of the API name | `string` | n/a | yes |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | value of the function name | `string` | n/a | yes |
| <a name="input_lambda_invoke_arn"></a> [lambda\_invoke\_arn](#input\_lambda\_invoke\_arn) | value of the Lambda invoke ARN | `string` | n/a | yes |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | value of the stage name | `string` | n/a | yes |
| <a name="input_usage_plan_name"></a> [usage\_plan\_name](#input\_usage\_plan\_name) | value of the usage plan | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_invoke_url"></a> [invoke\_url](#output\_invoke\_url) | value of the invoke URL |
<!-- END_TF_DOCS -->