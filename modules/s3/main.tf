
resource "aws_s3_bucket" "d2b_bucket" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    "terraform": "true", 
    "purpose": var.bucket_purpose,
    "environment": var.env
  }
}

resource "aws_s3_bucket_public_access_block" "d2b_bucket_block_public_access" {
  bucket = aws_s3_bucket.d2b_bucket.id

  block_public_acls        = true
  block_public_policy      = true 
  ignore_public_acls       = true
  restrict_public_buckets  = true
}

data "aws_iam_policy_document" "d2b_bucket_policy_generator" {
  statement {
    sid = var.bucket_policy_sid

    actions = var.bucket_policy_actions

    effect = var.bucket_policy_effect

    resources = [
        aws_s3_bucket.d2b_bucket.arn,
        "${aws_s3_bucket.d2b_bucket.arn}/*"
    ]

    principals {
      type = "AWS"
      identifiers = var.bucket_iam_principal_user_identifiers
    }
  }
}

resource "aws_s3_bucket_policy" "d2b_bucket_policy" {
  bucket = aws_s3_bucket.d2b_bucket.id
  policy = data.aws_iam_policy_document.d2b_bucket_policy_generator.json
}