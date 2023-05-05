data "aws_iam_policy_document" "lambda_assume_role_policy_generator" {
  statement {
    sid     = ""
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
        identifiers = ["lambda.amazonaws.com"]
        type        = "Service"
    }
  }
}

data "terraform_remote_state" "storage_s3" {
  backend = var.storage_s3_remote_state_backend 

  config = {
    bucket = var.storage_s3_remote_state_bucket
    key = var.storage_s3_remote_state_bucket_key
    region = var.aws_region
  }

}


data "aws_iam_policy_document" "lambda_s3_read_only_policy_generator" {
  statement {
    actions = var.lambda_default_policy_action

    effect = var.lambda_default_policy_effect

    resources = [
        data.terraform_remote_state.storage_s3.outputs.raw_layer_bucket_arn,
        "${data.terraform_remote_state.storage_s3.outputs.raw_layer_bucket_arn}/*"
    ]

    
  }

}