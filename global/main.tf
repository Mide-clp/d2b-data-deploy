terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}

terraform {
  backend "s3" {
    key  = "global/backend/terraform.tfstate"
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "d2b_tf_remote_state" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "d2b_tf_remote_state" {
  bucket = aws_s3_bucket.d2b_tf_remote_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "d2b_tf_remote_state" {
  bucket = aws_s3_bucket.d2b_tf_remote_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "d2b_tf_remote_state" {
  bucket = aws_s3_bucket.d2b_tf_remote_state.id

  block_public_acls        = true
  block_public_policy      = true 
  ignore_public_acls       = true
  restrict_public_buckets  = true
}

resource "aws_dynamodb_table" "tf_remote_lock" {
  name     = var.dynamod_table_name
  hash_key = "LockID"

  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}