resource "aws_iam_role" "lambda_ingestion_role" {
  name = var.lambda_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy_generator.json

}

resource "aws_iam_policy" "lambda_read_only_policy" {
  name = "lambda_read_only_policy"
  policy = data.aws_iam_policy_document.lambda_s3_write_only_policy_generator.json
}

resource "aws_iam_policy_attachment" "policy_attachment" {
 name = "lambda_policy_attachment"
 roles = [aws_iam_role.lambda_ingestion_role.name]
 policy_arn =  aws_iam_policy.lambda_read_only_policy.arn
}