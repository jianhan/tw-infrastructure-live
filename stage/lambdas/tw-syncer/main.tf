# ------------------------------------------------------------------------------
# LAMBDA FUNCTION
# ------------------------------------------------------------------------------
module "tw_syncer_lambda" {
  source = "github.com/jianhan/tw-infrastructure-modules//lambdas/tw-syncer?ref=v1.0.2"
  environment_variables = var.lambda_environment_variables
}
