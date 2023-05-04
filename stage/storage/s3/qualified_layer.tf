module "s3_qualified_layer_bucket" {
  source                                = "../../../modules/s3"
  bucket_name                           = var.qualified_bucket_name
  bucket_tags                         = var.qualified_bucket_tags
  bucket_iam_principal_user_identifiers = var.qualified_bucket_arn
}