output "raw_layer_bucket_id" {
    value = module.s3_raw_layer_bucket.s3_bucket_id
}

output "raw_layer_bucket_arn" {
    value = module.s3_raw_layer_bucket.s3_bucket_arn
}

output "raw_layer_bucket_domain_name" {
    value = module.s3_raw_layer_bucket.s3_bucket_domain_name
}



output "s3_qualified_layer_bucket_id" {
    value = module.s3_qualified_layer_bucket.s3_bucket_id
}

output "s3_qualified_layer_bucket_arn" {
    value = module.s3_qualified_layer_bucket.s3_bucket_arn
}

output "s3_qualified_layer_bucket_domain_name" {
    value = module.s3_qualified_layer_bucket.s3_bucket_domain_name
}



output "helper_bucket_id" {
    value = module.s3_helper_bucket.s3_bucket_id
}

output "helper_bucket_arn" {
    value = module.s3_helper_bucket.s3_bucket_arn
}

output "helper_bucket_domain_name" {
    value = module.s3_helper_bucket.s3_bucket_domain_name
}
