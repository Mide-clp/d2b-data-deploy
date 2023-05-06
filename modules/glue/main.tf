resource "aws_glue_job" "glue_job" {
  name                   = var.glue_job_name
  role_arn               = var.create_role ? join("", aws_iam_role.glue_role.*.arn) : var.role_arn
  description            = var.description
  glue_version           = var.glue_version
  max_retries            = var.max_retries
  timeout                = var.timeout
  worker_type            = var.worker_type
  number_of_workers      = var.number_of_workers
  tags                   = var.tags

  command {
    name            = "glueetl"
    script_location = var.script_location
    python_version  = var.python_version
  }

  default_arguments = {
    "--job-language"                          = var.job_language
    "--enable-continuous-cloudwatch-log"      = var.enable_logging_cloudwatch
    "--enable-spark-ui"                       = var.enable_spark_ui
    "--spark-event-logs-path"                 = var.spark_event_logs_path

  }
}

data "aws_iam_policy_document" "glue_assume_role_policy_generator" {
  statement {
    sid     = ""
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
        identifiers = ["glue.amazonaws.com"]
        type        = "Service"
    }
  }
}

resource "aws_iam_role" "glue_role" {
  count              = var.create_role ? 1 : 0
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.glue_assume_role_policy_generator.json

}

resource "aws_glue_trigger" "job_trigger" {
  count    = var.create_trigger ? 1: 0
  name     = var.trigger_name
  schedule = var.trigger_cron_schedule 
  type     = var.trigger_type 
  start_on_creation = var.start_trigger_on_creation #false

  actions {
    job_name = aws_glue_job.glue_job.name
  }
}