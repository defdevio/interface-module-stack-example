module "application" {
  source = "github.com/defdevio/interface-module-example?ref=v1.0.0"

  account_id  = var.account_id
  aws_region  = var.aws_region
  environment = var.environment

  aws_skip_credentials_validation = var.aws_skip_credentials_validation

  lambda_functions = {
    orders = {
      spec = {
        description = "Processes order events"
        ecr = {
          image_tag = "2026.09.1"
        }
        environment_variables = {
          NODE_ENV = "dev"
        }
        custom_iam_policy_statements = [
          {
            sid       = "ReadOrders"
            actions   = ["dynamodb:GetItem"]
            resources = ["arn:aws:dynamodb:${var.aws_region}:${var.account_id}:table/orders"]
          }
        ]
      }
    }
  }

  s3_buckets = {
    order_exports = {
      spec = {
        resource_key_ref = "orders"
      }
    }
    shared_assets = {
      spec = {}
    }
  }
}