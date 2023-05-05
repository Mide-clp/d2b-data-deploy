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

variable "s3_bucket_name" {
  type         = string
  default      = "Allow"
  description  = "The name of the bucket the lambda file is stored"
}

variable "s3_bucket_key" {
  type         = string
  description  = "The key of the file in the bucket"
}

variable "lambda_run_time" {
  type         = string
  default      = "python3.9"
  description  = "The run time to be used"
}

variable "lambda_handler" {
  type         = string
  description  = "The identifier of the function to call"
}

variable "lambda_role" {
  type         = string
  description  = "The role to be assigned to the function"
}

variable "lambda_memory_size" {
  type         = number
  default      = 128
  description  = "memory size given to the function"
}


variable "lambda_timeout" {
  type         = number
  default      = 90
  description  = "The run time to be used"
}