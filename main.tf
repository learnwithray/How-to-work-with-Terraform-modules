module "lambda" {
  source = "./module/lambda"

  region                       = var.region
  lambda_name                  = "lambda-${var.environment}-${var.team}"
  lambda_handler               = "index.handler"
  lambda_runtime               = "nodejs20.x"
  lambda_zip_file              = "lambda.zip"
  lambda_memory_size           = 128
  lambda_timeout               = 10
  lambda_environment_variables = {
    "ENV_VAR1" = "value1"
    "ENV_VAR2" = "value2"
  }
  lambda_publish               = true
  lambda_role_name             = "my-lambda-role"
  lambda_policy_name           = "my-lambda-policy"
  lambda_policy                = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

output "lambda_arn" {
  value = module.lambda.lambda_arn
}

output "lambda_invoke_arn" {
  value = module.lambda.lambda_invoke_arn
}