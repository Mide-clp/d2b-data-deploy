data "terraform_remote_state" "storage_s3" {
  backend = var.storage_s3_remote_state_backend 

  config = {
    bucket = var.storage_s3_remote_state_bucket
    key = var.storage_s3_remote_state_bucket_key
    region = var.aws_region
  }

}


data "aws_iam_policy_document" "glue_ingestion_write_only_policy_generator" {
  statement {
    actions = var.glue_ingestion_write_only_policy_action

    effect = var.glue_ingestion_write_only_policy_effect

    resources = [
        data.terraform_remote_state.storage_s3.outputs.raw_layer_bucket_arn,
        "${data.terraform_remote_state.storage_s3.outputs.raw_layer_bucket_arn}/*"
    ]

    
  }

    statement {
    actions = [
        "s3:GetObject",
        "s3:ListBucket"
    ]

    effect = var.glue_ingestion_write_only_policy_effect

    resources = [
         data.terraform_remote_state.storage_s3.outputs.helper_bucket_arn,
        "${data.terraform_remote_state.storage_s3.outputs.helper_bucket_arn}/*"
    ]

    
  }

}


data "aws_iam_policy_document" "glue_processing_read_write_only_policy_generator" {
  statement {
    actions = var.glue_ingestion_write_only_policy_action

    effect = var.glue_ingestion_write_only_policy_effect

    resources = [
        data.terraform_remote_state.storage_s3.outputs.s3_qualified_layer_bucket_arn,
        "${data.terraform_remote_state.storage_s3.outputs.s3_qualified_layer_bucket_arn}/*"
    ]

    
  }

  statement {
    actions = [
        "s3:GetObject",
        "s3:ListBucket"
    ]

    effect = var.glue_ingestion_write_only_policy_effect

    resources = [
        data.terraform_remote_state.storage_s3.outputs.raw_layer_bucket_arn,
        "${data.terraform_remote_state.storage_s3.outputs.raw_layer_bucket_arn}/*",
         data.terraform_remote_state.storage_s3.outputs.helper_bucket_arn,
        "${data.terraform_remote_state.storage_s3.outputs.helper_bucket_arn}/*"
    ]

    
  }

}