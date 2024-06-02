resource "aws_iam_role" "lambda_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name   = var.lambda_policy_name
  role   = aws_iam_role.lambda_role.id
  policy = var.lambda_policy
}

resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_name
  role          = aws_iam_role.lambda_role.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  filename      = var.lambda_zip_file

  environment {
    variables = var.lambda_environment_variables
  }

  memory_size      = var.lambda_memory_size
  timeout          = var.lambda_timeout
  publish          = var.lambda_publish
  source_code_hash = filebase64sha256(var.lambda_zip_file)
}