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
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.allow_to_connect_to_rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.allow_to_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_secretsmanager_secret_version.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_architectures"></a> [architectures](#input\_architectures) | value of the architectures | `list(string)` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | value of the function name | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | value of the handler | `string` | n/a | yes |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | value of the log retention in days | `number` | n/a | yes |
| <a name="input_node_env"></a> [node\_env](#input\_node\_env) | value of the node env | `string` | n/a | yes |
| <a name="input_private_subnet_ids"></a> [private\_subnet\_ids](#input\_private\_subnet\_ids) | value of the private subnet ids | `list(string)` | n/a | yes |
| <a name="input_publish"></a> [publish](#input\_publish) | value of the publish | `bool` | n/a | yes |
| <a name="input_rds_host"></a> [rds\_host](#input\_rds\_host) | value of the rds host | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | value of the role name | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | value of the runtime | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | value of the s3 bucket name | `string` | n/a | yes |
| <a name="input_s3_object_key"></a> [s3\_object\_key](#input\_s3\_object\_key) | value of the s3 object key | `string` | n/a | yes |
| <a name="input_secret_id"></a> [secret\_id](#input\_secret\_id) | value of the secret id | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | value of the security group ids | `list(string)` | n/a | yes |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | value of the source code hash | `string` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | value of the timeout | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | value of the function name |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | value of the invoke ARN |
<!-- END_TF_DOCS -->