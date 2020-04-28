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
    key            = "tw-infrastructure-live/staging/lambdas/tw-syncer.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# ------------------------------------------------------------------------------
# LAMBDA FUNCTION
# ------------------------------------------------------------------------------
module "tw_syncer_lambda" {
  source = "github.com/jianhan/tw-infrastructure-modules//lambdas/tw-syncer?ref=v1.0.12"
  environment_variables = {
    NODE_ENV                = var.node_env
    SERVICE_NAME            = var.service_name
    CONSUMER_API_KEY        = var.consumer_api_key
    CONSUMER_API_SECRET_KEY = var.consumer_api_secret_key
    ACCESS_TOKEN            = var.access_token
    ACCESS_SECRET           = var.access_secret
    S3_ACCESS_KEY_ID        = var.s3_access_key_id
    S3_SECRET_ACCESS_KEY    = var.s3_secret_access_key
    S3_BUCKET_NAME          = var.s3_bucket_name
  }
  lambda_function_s3_bucket = "jian-personal-lambdas"
  lambda_function_s3_key    = "tw-syncer/v1.27.1/lambda-v1.27.1.zip"
}
