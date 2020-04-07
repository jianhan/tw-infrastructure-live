variable "node_env" {
  type        = string
  description = "NODE_ENV for labmda"
  default     = "staging"
}

variable "service_name" {
  type        = string
  description = "SERVICE_NAME for labmda"
  default     = "staging-tw-lambda"
}

variable "consumer_api_key" {
  type        = string
  description = "CONSUMER_API_KEY for labmda"
}

variable "consumer_api_secret_key" {
  type        = string
  description = "CONSUMER_API_SECRET_KEY for labmda"
}

variable "access_token" {
  type        = string
  description = "ACCESS_TOKEN for labmda"
}

variable "access_secret" {
  type        = string
  description = "ACCESS_SECRET for labmda"
}

variable "s3_access_key_id" {
  type        = string
  description = "S3_ACCESS_KEY_ID for labmda"
}

variable "s3_secret_access_key" {
  type        = string
  description = "S3_SECRET_ACCESS_KEY for labmda"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3_BUCKET_NAME for labmda"
  default     = "jian-personal-lambda-data"
}
