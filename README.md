# Interface Module Stack Example

A consumer repository for the [Interface Module pattern](https://defdev.io/blog/interface-module-pattern).

This repository demonstrates the important boundary: the application team declares its desired functions, buckets, relationships, and application-specific permissions in the stack, while the Interface Module owns IAM, ECR, Lambda, S3 wiring, naming, security defaults, and generated environment variables.

The application specification lives directly in the `module "application"` call in [`main.tf`](main.tf), making the consumer experience visible in one place.

## Plan the stack

Requirements: OpenTofu 1.6+ or Terraform 1.6+, an AWS account ID, and network access to GitHub. Planning does not create AWS resources.

```sh
tofu init
tofu fmt -check
tofu validate
tofu plan -var='aws_account_id=123456789012'
```

To use Terraform, replace `tofu` with `terraform`.

The GitHub Actions workflow runs the same `init`, `validate`, and `plan` steps with placeholder credentials and provider validation disabled. It demonstrates a successful plan without connecting to an AWS account.

Applying the example requires AWS credentials and a Lambda container image pushed to the planned ECR repository.

## What the consumer controls

- Logical keys such as `orders` and `order_exports`
- Lambda descriptions, image tags, environment variables, and application permissions
- Which S3 bucket is associated with which Lambda through `resource_key_ref`
- The target account, Region, and environment

The consumer does not construct IAM role ARNs, ECR image URLs, bucket names, bucket access policies, or Lambda bucket ARN environment variables.