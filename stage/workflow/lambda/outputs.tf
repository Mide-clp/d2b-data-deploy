output "batch_function_name" {
  description = "Name of the batch Lambda function."
  value = module.lambda_ingestion_batch.function_name
}

output "real_time_function_name" {
  description = "Name of the real-time Lambda function."
  value = module.lambda_ingestion_real_time.function_name
}