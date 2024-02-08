# serverless-express-with-terraform

This repository contains sample code for building AWS infrastructure resources with Terraform using Lambda and API Gateway configuration for an API utilizing [serverless-express](https://github.com/CodeGenieApp/serverless-express).

## Architecture diagram

The diagram created using [pluralith](https://github.com/Pluralith/pluralith-cli).

![project_pluralith-local-project%2Frun_4511613%2Frun_4511613_1707395331764](https://github.com/shogo452/serverless-express-with-terraform/assets/54160947/20fa2ca9-635a-4261-b2fb-8874dca2f203)

## Directory structure

```text
terraform
├── environments 👈 Environment-specific configuration files
│   ├── common
│   │   ├── README.md
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   └── version.tf
│   ├── dev
│   │   ├── README.md
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── provider.tf
│   │   └── version.tf
│   ├── prod
│   │   └── README.md
│   └── stg
│       └── README.md
└── modules 👈 Modules for each service
    ├── api_gateway
    │   ├── README.md
    │   ├── main.tf
    │   ├── output.tf
    │   ├── setting
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variable.tf
    │   └── variables.tf
    ├── ec2
    │   ├── README.md
    │   ├── main.tf
    │   ├── output.tf
    │   └── variables.tf
    ├── lambda
    │   ├── README.md
    │   ├── main.tf
    │   ├── output.tf
    │   └── variable.tf
    ├── rds
    │   ├── reader
    │   │   └── README.md
    │   └── writer
    │       ├── README.md
    │       ├── main.tf
    │       ├── output.tf
    │       └── variables.tf
    ├── route53
    │   ├── README.md
    │   ├── main.tf
    │   ├── output.tf
    │   └── variables.tf
    ├── s3
    │   ├── README.md
    │   ├── bucket
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   └── object
    │       ├── latest.zip
    │       ├── main.tf
    │       ├── output.tf
    │       ├── src
    │       │   └── latest.js
    │       └── variables.tf
    └── vpc
        ├── README.md
        ├── main.tf
        ├── output.tf
        └── variables.tf
```

## Additional required resources

The creation of the following resources, which are not managed by this repository, is required separately.

* S3 Bucket for tfstate file
  * Bucket name like `serverless-express-with-terraform-tfstate`
* Sercrets in Secrets Manager
  * master_username
  * master_password
  * port
  * database_name
  * kms_key_id
  * api_key
* KMS Key for RDS
  If not already created, please use the following CLI command to create the key.

  `aws kms describe-key --key-id alias/aws/rds --region {region-name}`

## Preparation of access keys

```
$ vim ~/.aws/credentials

# 👇 Add the following
[serverless-express-with-terraform]
aws_access_key_id=xxxxxxxxxxxx
aws_secret_access_key=xxxxxxxxxxxx
```
