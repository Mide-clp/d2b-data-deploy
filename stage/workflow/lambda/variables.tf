variable "aws_region" {
  type         = string
  default      = "us-east-1"
  description  = "default region for deployment"
}

variable "s3_bucket_key" {
  type         = string
  default      = "lambda/lambdafunc.zip"
  description  = "bucket key idenitifier"
}

variable "lambda_handler" {
  type         = string
  default      = "lambda_function.lambda_handler"
  description  = "entrypoint for the code"
}

variable "lambda_ingestion_batch_memory_size" {
  type         = number
  default      = 512
  description  = "memory size allocated to batch function"
}

variable "lambda_ingestion_real_time_tags" {
  type = map(string)
  default = {
    "terraform": "true", 
    "purpose": "real time lambda function",
    "environment": "stage"
  }
  description  = "tags for lambda realtime function"
}

variable "lambda_ingestion_batch_tags" {
  type = map(string)
  default = {
    "terraform": "true", 
    "purpose": "real time lambda function",
    "environment": "stage"
  }
  description  = "tags for lambda batch function"
}

variable "lambda_iam_role_name" {
  type         = string
  default      = "LambdaIngestionRole"
  description  = "name for the lambda role"
}

variable "storage_s3_remote_state_backend" {
  type         = string
  default      = "s3"
  description  = "backend used"
} 


variable "storage_s3_remote_state_bucket" {
  type         = string
  default      = "mide-d2b-tf-backend"
  description  = "bucket where the remote state is located"
} 

variable "storage_s3_remote_state_bucket_key" {
  type         = string
  default      = "stage/storage/s3/terraform.tfstate"
  description  = "bucket key that point to the s3 storage backend"
}

variable "lambda_default_policy_action" {
  type         = list(string)
  default      = [ 
             "s3:PutObject"
          ]
  description  = "list of action policy to be assigned to the bucket"
}

variable "lambda_default_policy_effect" {
  type         = string
  default      = "Allow"
  description  = "The effects of the actions given"
}
