module "s3_helper_bucket" {
  source                                = "../../../modules/s3"
  bucket_name                           = var.helper_bucket_name
  bucket_tags                         = var.helper_bucket_tags
  bucket_iam_principal_user_identifiers = var.helper_bucket_arn
}

resource "aws_s3_object" "upload_scripts" {
  bucket = module.s3_helper_bucket.s3_bucket_id
  for_each = fileset("../scripts/", "*")
  key = each.value
  source = "../scripts/${each.value}"
  etag = filemd5("../scripts/${each.value}")
}