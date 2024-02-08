<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.31.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_api_gateway"></a> [api\_gateway](#module\_api\_gateway) | ../../modules/api_gateway | n/a |
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ../../modules/ec2 | n/a |
| <a name="module_lambda"></a> [lambda](#module\_lambda) | ../../modules/lambda | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ../../modules/rds/writer | n/a |
| <a name="module_route53"></a> [route53](#module\_route53) | ../../modules/route53 | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ../../modules/s3/object | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../../modules/vpc | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gateway_invoke_url"></a> [api\_gateway\_invoke\_url](#output\_api\_gateway\_invoke\_url) | value of the API Gateway invoke URL |
| <a name="output_api_gateway_log_group_name"></a> [api\_gateway\_log\_group\_name](#output\_api\_gateway\_log\_group\_name) | value of the API Gateway log group name |
| <a name="output_ec2_instance_id"></a> [ec2\_instance\_id](#output\_ec2\_instance\_id) | value of the EC2 instance ID |
| <a name="output_ec2_instance_public_ip"></a> [ec2\_instance\_public\_ip](#output\_ec2\_instance\_public\_ip) | value of the EC2 instance public IP |
| <a name="output_ec2_root_block_device_volume_id"></a> [ec2\_root\_block\_device\_volume\_id](#output\_ec2\_root\_block\_device\_volume\_id) | value of the EC2 root block device volume ID |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | value of the function name |
| <a name="output_lambda_invoke_arn"></a> [lambda\_invoke\_arn](#output\_lambda\_invoke\_arn) | value of the invoke ARN |
| <a name="output_lambda_security_group_id"></a> [lambda\_security\_group\_id](#output\_lambda\_security\_group\_id) | value of the lambda security group ID |
| <a name="output_rds_reader_endpoint"></a> [rds\_reader\_endpoint](#output\_rds\_reader\_endpoint) | value of the RDS reader instance endpoint |
| <a name="output_rds_writer_endpoint"></a> [rds\_writer\_endpoint](#output\_rds\_writer\_endpoint) | value of the RDS writer instance endpoint |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | value of the VPC ID |
| <a name="output_vpc_internet_gateway_id"></a> [vpc\_internet\_gateway\_id](#output\_vpc\_internet\_gateway\_id) | value of the internet gateway ID |
| <a name="output_vpc_private_subnet_1a_id"></a> [vpc\_private\_subnet\_1a\_id](#output\_vpc\_private\_subnet\_1a\_id) | value of the private subnet 1a ID |
| <a name="output_vpc_private_subnet_1c_id"></a> [vpc\_private\_subnet\_1c\_id](#output\_vpc\_private\_subnet\_1c\_id) | value of the private subnet 1c ID |
| <a name="output_vpc_private_subnet_1d_id"></a> [vpc\_private\_subnet\_1d\_id](#output\_vpc\_private\_subnet\_1d\_id) | value of the private subnet 1d ID |
| <a name="output_vpc_public_subnet_1a_cidr_block"></a> [vpc\_public\_subnet\_1a\_cidr\_block](#output\_vpc\_public\_subnet\_1a\_cidr\_block) | value of the public subnet 1a CIDR block |
| <a name="output_vpc_public_subnet_1a_id"></a> [vpc\_public\_subnet\_1a\_id](#output\_vpc\_public\_subnet\_1a\_id) | value of the public subnet 1a ID |
| <a name="output_vpc_public_subnet_1c_cidr_block"></a> [vpc\_public\_subnet\_1c\_cidr\_block](#output\_vpc\_public\_subnet\_1c\_cidr\_block) | value of the public subnet 1c CIDR block |
| <a name="output_vpc_public_subnet_1c_id"></a> [vpc\_public\_subnet\_1c\_id](#output\_vpc\_public\_subnet\_1c\_id) | value of the public subnet 1c ID |
| <a name="output_vpc_rds_security_group_id"></a> [vpc\_rds\_security\_group\_id](#output\_vpc\_rds\_security\_group\_id) | value of the rds security group ID |
| <a name="output_vpc_ssh_security_group_id"></a> [vpc\_ssh\_security\_group\_id](#output\_vpc\_ssh\_security\_group\_id) | value of the ssh security group ID |
<!-- END_TF_DOCS -->