module "s3" {
  source                                = "../../../../modules/s3"
  bucket_name                           = var.bucket_name
  bucket_tags                           = var.bucket_tags
  bucket_iam_principal_user_identifiers = var.bucket_arn
}