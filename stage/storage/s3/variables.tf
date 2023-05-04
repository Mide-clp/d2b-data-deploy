variable "aws_region" {
  type         = string
  default      = "us-east-1"
  description  = "default region for deployment"
}

variable "raw_bucket_name" {
  type         = string
  default      = "d2b-mide-raw-layer"
  description  = "name to give the bucket"
}

variable "raw_bucket_tags" {
  type    = map(string)
  default = {
    "terraform": "true", 
    "purpose": "raw layer",
    "environment": "stage"
  }
  description  = "tags for the bucket"
}

variable "raw_bucket_arn" {
  type         = list(string)
  description  = "list of user IAM arn to give permission to interact with the bucket"
}

variable "qualified_bucket_name" {
  type         = string
  default      = "d2b-mide-qualified-layer"
  description  = "name to give the bucket"
}

variable "qualified_bucket_tags" {
  type    = map(string)
  default = {
    "terraform": "true", 
    "purpose": "qualified layer",
    "environment": "stage"
  }
  description  = "tags for the bucket"
}

variable "qualified_bucket_arn" {
  type         = list(string)
  description  = "list of user IAM arn to give permission to interact with the bucket"
}

variable "helper_bucket_name" {
  type         = string
  default      = "d2b-mide-helper-storage"
  description  = "name to give the bucket"
}

variable "helper_bucket_tags" {
  type    = map(string)
  default = {
    "terraform": "true", 
    "purpose": "helper storage",
    "environment": "stage"
  }
  description  = "tags for the bucket"
}

variable "helper_bucket_arn" {
  type         = list(string)
  description  = "list of user IAM arn to give permission to interact with the bucket"
} 
