provider "aws" {
  shared_config_files = ["$HOME/.aws/credentials"]
  profile             = "serverless-express-with-terraform"
  region              = "ap-northeast-1"
}
