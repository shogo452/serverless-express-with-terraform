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
| [aws_route53_record.rds_main_host_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.rds_replica_host_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | value of the comment | `string` | n/a | yes |
| <a name="input_rds_main_host_alias_name"></a> [rds\_main\_host\_alias\_name](#input\_rds\_main\_host\_alias\_name) | value of the rds main host alias name | `string` | n/a | yes |
| <a name="input_rds_reader_endpoint"></a> [rds\_reader\_endpoint](#input\_rds\_reader\_endpoint) | value of the rds reader endpoint | `string` | n/a | yes |
| <a name="input_rds_replica_host_alias_name"></a> [rds\_replica\_host\_alias\_name](#input\_rds\_replica\_host\_alias\_name) | value of the rds replica host alias name | `string` | n/a | yes |
| <a name="input_rds_writer_endpoint"></a> [rds\_writer\_endpoint](#input\_rds\_writer\_endpoint) | value of the rds writer endpoint | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | value of the vpc id | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | value of the zone name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->