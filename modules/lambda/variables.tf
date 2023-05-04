variable "lambda_func_name" {
  type         = string
  description  = "name to be given to the lambda function"
}

variable "lambda_tags" {
  type = map(string)
  default = {
    "terraform": "true", 
    "purpose": "",
    "environment": "stage"
  }
  description  = "tags for the bucket"
}


variable "bucket_policy_actions" {
  type         = list(string)
  default      = [ 
             "s3:DeleteObject",
             "s3:GetObject",
             "s3:ListBucket",
             "s3:PutObject"
          ]
  description  = "list of IAM action policy to be assigned to the bucket"
}

variable "bucket_iam_principal_user_identifiers" {
  type         = list(string)
  description  = "list of arn to give permission to interact with the bucket"
}

variable "s3_bucket_name" {
  type         = string
  default      = "Allow"
  description  = "The name of the bucket the lambda file is stored"
}

variable "s3_bucket_key" {
  type         = string
  default      = "Allow"
  description  = "The key of the file in the bucket"
}

variable "lambda_run_time" {
  type         = string
  default      = "AllowUsers"
  description  = "The run time to be used"
}

variable "lambda_handler" {
  type         = string
  default      = "AllowUsers"
  description  = "The identifier of the function to call"
}

variable "lambda_role" {
  type         = string
  default      = "AllowUsers"
  description  = "The role to be assigned to the function"
}

variable "lambda_memory_size" {
  type         = number
  default      = "AllowUsers"
  description  = "memory size given to the function"
}

variable "lambda_memory_size" {
  type         = number
  default      = "AllowUsers"
  description  = "The run time to be used"
}

variable "lambda_timeout" {
  type         = number
  default      = "AllowUsers"
  description  = "The run time to be used"
}