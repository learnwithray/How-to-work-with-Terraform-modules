# AWS Region
variable "region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = ""
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = ""
}
# organization Division
variable "organization" {
  description = "organization- Infrastructure"
  type        = string
  default     = ""
}
# team Variable
variable "team" {
  description = "organization team for  Infrastructure belongs"
  type        = string
  default     = ""
}


variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "The handler for the Lambda function"
  type        = string
  default     = "index.handler"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function"
  type        = string
  default     = "nodejs20.x"
}

variable "lambda_zip_file" {
  description = "The path to the Lambda deployment package"
  type        = string
}

variable "lambda_memory_size" {
  description = "The amount of memory in MB for the Lambda function"
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "The amount of time in seconds for the Lambda function timeout"
  type        = number
  default     = 3
}

variable "lambda_environment_variables" {
  description = "A map of environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}

variable "lambda_publish" {
  description = "Whether to publish a new version of the Lambda function on update"
  type        = bool
  default     = false
}

variable "lambda_role_name" {
  description = "The name of the IAM role for the Lambda function"
  type        = string
}

variable "lambda_policy_name" {
  description = "The name of the IAM policy for the Lambda function"
  type        = string
}

variable "lambda_policy" {
  description = "The IAM policy for the Lambda function"
  type        = string
}