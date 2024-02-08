terraform {
  backend "s3" {
    bucket              = "serverless-express-with-terraform-tfstate"
    key                 = "dev/terraform.tfstate"
    region              = "ap-northeast-1"
    shared_config_files = ["$HOME/.aws/credentials"]
    profile             = "serverless-express-with-terraform"
  }
}
