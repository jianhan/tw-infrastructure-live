# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS REGION
# ------------------------------------------------------------------------------
provider "aws" {
  region = "ap-southeast-2"
}

# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket         = "jian-personal-terraform-states"
    key            = "tw-syncer/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# ------------------------------------------------------------------------------
# LAMBDA FUNCTION
# ------------------------------------------------------------------------------
module "tw_syncer_lambda" {
  source = "github.com/jianhan/tw-infrastructure-modules//lambdas/tw-syncer?ref=v1.0.8"
  environment_variables = var.lambda_environment_variables
  lambda_function_s3_bucket = "jian-personal-lambdas"
  lambda_function_s3_key = "tw-syncer/lambda.zip"
}
