variable "aws_region" {
  type         = string
  default      = "us-east-1"
  description  = "default region for deployment"
}

variable "bucket_name" {
  type         = string
  default      = "mide-d2b-tf-backend"
  description  = "default region for deployment"
}

variable "dynamod_table_name" {
  type         = string
  default      = "mide-d2b-lock-backend"
  description  = "default region for deployment"
}