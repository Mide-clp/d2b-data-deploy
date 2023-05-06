module "processing_glue_job" {
  source          = "../../../modules/glue"
  glue_job_name   = var.processing_layer_job_name
  create_role     = true
  iam_role_name   = var.processing_layer_role_name
  script_location = "s3://${data.terraform_remote_state.storage_s3.outputs.helper_bucket_id}/${var.processing_file_name}"
  tags            = var.processing_layer_job_tags
  create_trigger  = true
  trigger_name    = var.processing_layer_trigger_name
  trigger_cron_schedule = var.processing_layer_trigger_schedule


}

resource "aws_iam_policy" "glue_processing_read_write_only_policy" {
  name = "glue_processing_read_write_only_policy"
  policy = data.aws_iam_policy_document.glue_processing_read_write_only_policy_generator.json
}

resource "aws_iam_policy_attachment" "processing_policy_attachment" {
 name = "glue_processing_policy_attachment"
 roles = [module.processing_glue_job.glue_job_role_name]
 policy_arn =  aws_iam_policy.glue_processing_read_write_only_policy.arn
}
