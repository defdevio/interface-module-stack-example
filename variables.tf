variable "account_id" {
  description = "AWS account ID used in names and IAM trust policies."
  type        = string
}

variable "aws_region" {
  description = "AWS region where the stack resources will be created."
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name passed to the Interface Module."
  type        = string
  default     = "dev"
}

variable "aws_skip_credentials_validation" {
  description = "Skip AWS credential, metadata, and account ID validation; intended for plan-only tests."
  type        = bool
  default     = false
}