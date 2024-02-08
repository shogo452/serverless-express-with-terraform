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
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route_table.public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.allow_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.private_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_1a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_1c](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_ssh_cidr_blocks"></a> [allow\_ssh\_cidr\_blocks](#input\_allow\_ssh\_cidr\_blocks) | value of the CIDR blocks to allow SSH access | `list(string)` | n/a | yes |
| <a name="input_internet_gateway_name"></a> [internet\_gateway\_name](#input\_internet\_gateway\_name) | value of the internet gateway name | `string` | n/a | yes |
| <a name="input_private_subnet_1a_cidr_block"></a> [private\_subnet\_1a\_cidr\_block](#input\_private\_subnet\_1a\_cidr\_block) | value of the private subnet 1a CIDR block | `string` | n/a | yes |
| <a name="input_private_subnet_1a_name"></a> [private\_subnet\_1a\_name](#input\_private\_subnet\_1a\_name) | value of the private subnet 1a name | `string` | n/a | yes |
| <a name="input_private_subnet_1c_cidr_block"></a> [private\_subnet\_1c\_cidr\_block](#input\_private\_subnet\_1c\_cidr\_block) | value of the private subnet 1c CIDR block | `string` | n/a | yes |
| <a name="input_private_subnet_1c_name"></a> [private\_subnet\_1c\_name](#input\_private\_subnet\_1c\_name) | value of the private subnet 1c name | `string` | n/a | yes |
| <a name="input_public_subnet_1a_cidr_block"></a> [public\_subnet\_1a\_cidr\_block](#input\_public\_subnet\_1a\_cidr\_block) | value of the public subnet 1a CIDR block | `string` | n/a | yes |
| <a name="input_public_subnet_1a_name"></a> [public\_subnet\_1a\_name](#input\_public\_subnet\_1a\_name) | value of the public subnet 1a name | `string` | n/a | yes |
| <a name="input_public_subnet_1c_cidr_block"></a> [public\_subnet\_1c\_cidr\_block](#input\_public\_subnet\_1c\_cidr\_block) | value of the public subnet 1c CIDR block | `string` | n/a | yes |
| <a name="input_public_subnet_1c_name"></a> [public\_subnet\_1c\_name](#input\_public\_subnet\_1c\_name) | value of the public subnet 1c name | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | value of the VPC CIDR block | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | value of the VPC name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_internet\_gateway\_id) | value of the internet gateway ID |
| <a name="output_lambda_security_group_id"></a> [lambda\_security\_group\_id](#output\_lambda\_security\_group\_id) | value of the lambda security group ID |
| <a name="output_private_subnet_1a_id"></a> [private\_subnet\_1a\_id](#output\_private\_subnet\_1a\_id) | value of the private subnet 1a ID |
| <a name="output_private_subnet_1c_id"></a> [private\_subnet\_1c\_id](#output\_private\_subnet\_1c\_id) | value of the private subnet 1c ID |
| <a name="output_public_subnet_1a_cidr_block"></a> [public\_subnet\_1a\_cidr\_block](#output\_public\_subnet\_1a\_cidr\_block) | value of the public subnet 1a CIDR block |
| <a name="output_public_subnet_1a_id"></a> [public\_subnet\_1a\_id](#output\_public\_subnet\_1a\_id) | value of the public subnet 1a ID |
| <a name="output_public_subnet_1c_cidr_block"></a> [public\_subnet\_1c\_cidr\_block](#output\_public\_subnet\_1c\_cidr\_block) | value of the public subnet 1c CIDR block |
| <a name="output_public_subnet_1c_id"></a> [public\_subnet\_1c\_id](#output\_public\_subnet\_1c\_id) | value of the public subnet 1c ID |
| <a name="output_rds_security_group_id"></a> [rds\_security\_group\_id](#output\_rds\_security\_group\_id) | value of the rds security group ID |
| <a name="output_ssh_security_group_id"></a> [ssh\_security\_group\_id](#output\_ssh\_security\_group\_id) | value of the ssh security group ID |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | value of the VPC ID |
<!-- END_TF_DOCS -->