output "function_name" {
  description = "Name of the Lambda function."

  value = aws_lambda_function.db2_lambda.function_name
}