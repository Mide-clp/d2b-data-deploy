output "s3_bucket_id" {
    value = aws_s3_bucket.d2b_bucket.id
}
output "s3_bucket_arn" {
    value = aws_s3_bucket.d2b_bucket.arn
}
output "s3_bucket_domain_name" {
    value = aws_s3_bucket.d2b_bucket.bucket_domain_name
}
output "s3_hosted_zone_id" {
    value = aws_s3_bucket.d2b_bucket.hosted_zone_id
}