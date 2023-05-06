output "glue_job_id" {
  description = "glue job name."

  value = aws_glue_job.glue_job.id
}

output "glue_job_arn" {
  description = "glue job ARN."

  value = aws_glue_job.glue_job.arn
}

output "glue_job_role_arn" {
  description = "glue job role ARN."

  value = var.create_role ? join("", aws_iam_role.glue_role.*.arn) : var.role_arn
}

output "glue_job_role_name" {
  description = "glue job role ARN."

  value = var.create_role ? join("", aws_iam_role.glue_role.*.name) : var.role_arn
}

output "glue_job_trigger_arn" {
  description = "ARN of glue job trigger."

  value = var.create_trigger ? join("", aws_glue_trigger.job_trigger.*.arn) : ""
}