module "ingestion_glue_job" {
  source          = "../../../modules/glue"
  glue_job_name   = var.ingestion_layer_job_name
  create_role     = true
  iam_role_name   = var.ingestion_layer_role_name
  script_location = "s3://${data.terraform_remote_state.storage_s3.outputs.helper_bucket_id}/${var.ingestion_file_name}"
  tags            = var.ingestion_layer_job_tags
  create_trigger  = true
  trigger_name    = var.ingestion_layer_trigger_name
  trigger_cron_schedule = var.ingestion_layer_trigger_schedule

}


resource "aws_iam_policy" "glue_ingestion_write_only_policy" {
  name = "glue_ingestion_write_only_policy"
  policy = data.aws_iam_policy_document.glue_ingestion_write_only_policy_generator.json
}

resource "aws_iam_policy_attachment" "policy_attachment" {
 name = "glue_policy_attachment"
 roles = [module.ingestion_glue_job.glue_job_role_name]
 policy_arn =  aws_iam_policy.glue_ingestion_write_only_policy.arn
}

