module "lambda_ingestion_batch" {
  source = "../../../modules/lambda"
  lambda_func_name = "batch_func"
  s3_bucket_name = data.terraform_remote_state.storage_s3.outputs.helper_bucket_id
  s3_bucket_key = var.s3_bucket_key
  lambda_handler = var.lambda_handler
  lambda_role = aws_iam_role.lambda_ingestion_role.arn
  lambda_memory_size = var.lambda_ingestion_batch_memory_size
  lambda_tags = var.lambda_ingestion_batch_tags
}