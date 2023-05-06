module "s3_raw_layer_bucket" {
  source                                = "../../../modules/s3"
  bucket_name                           = var.raw_bucket_name
  bucket_tags                           = var.raw_bucket_tags
  bucket_iam_principal_user_identifiers = var.raw_bucket_arn

}

resource "aws_s3_object" "upload_data" {
  bucket = module.s3_raw_layer_bucket.s3_bucket_id
  for_each = fileset("../../data/", "**")
  key = each.value
  source = "../../data/${each.value}"
  etag = filemd5("../../data/${each.value}")
}