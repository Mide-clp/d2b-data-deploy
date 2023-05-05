resource "aws_lambda_function" "db2_lambda" {
  function_name = var.lambda_func_name
  s3_bucket = var.s3_bucket_name
  s3_key = var.s3_bucket_key

  runtime = var.lambda_run_time 
  handler = var.lambda_handler 
  role = var.lambda_role
  tags = var.lambda_tags
  memory_size = var.lambda_memory_size
  timeout = var.lambda_timeout
}