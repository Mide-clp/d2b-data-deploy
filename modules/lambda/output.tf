output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store function code."

  value = aws_s3_bucket.db2_lambda.id
}

output "function_name" {
  description = "Name of the Lambda function."

  value = aws_lambda_function.db2_lambda.function_name
}