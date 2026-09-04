output "ecr_repository_urls" {
  description = "ECR repository URLs returned by the Interface Module."
  value       = module.application.ecr_repository_urls
}

output "lambda_function_arns" {
  description = "Lambda ARNs returned by the Interface Module."
  value       = module.application.lambda_function_arns
}

output "s3_bucket_arns" {
  description = "S3 bucket ARNs returned by the Interface Module."
  value       = module.application.s3_bucket_arns
}