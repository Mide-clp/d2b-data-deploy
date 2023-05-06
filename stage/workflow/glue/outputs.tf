output "ingestion_glue_job_id" {
  description = "glue job name."

  value = module.ingestion_glue_job.glue_job_id
}

output "ingestion_glue_job_arn" {
  description = "glue job ARN."

  value = module.ingestion_glue_job.glue_job_arn
}

output "ingestion_glue_job_role_arn" {
  description = "glue job role ARN."

  value = module.ingestion_glue_job.glue_job_role_arn
}

output "ingestion_glue_job_trigger_arn" {
  description = "ARN of glue job trigger."

  value = module.ingestion_glue_job.glue_job_trigger_arn
}