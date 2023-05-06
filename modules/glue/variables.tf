variable "glue_job_name" {
  type        = string
  description = "Default name for the glue job."
}

variable "create_role" {
  type        = bool
  default     = false
  description = "Create a new role for the resource."
}

variable "role_arn" {
  type        = string
  default     = ""
  description = "ARN to be attached to the job."
}

variable "iam_role_name" {
  type        = string
  default     = ""
  description = "role name for the IAM resource."
}

variable "description" {
  type        = string
  default     = ""
  description = "description given about the job."
}

variable "glue_version" {
  type        = string
  default     = "4.0"
  description = "The version of glue to use for this job."
}

variable "max_retries" {
  type        = number
  default     = 0
  description = "maximal number of retires if the job fails"
}

variable "timeout" {
  type        = number
  default     = 2880
  description = "Job timeout. The default is 2,880 minutes (48 hours) for a Glue ETL job"
}

variable "worker_type" {
  type        = string
  default     = "G.1X"
  description = "Set the type of predefined worker that is allowed when a job runs."
}

variable "number_of_workers" {
  type        = number
  default     = 5
  description = "The number of workers you want AWS Glue to allocate to this job."
}

variable "tags" {
  type = map(string)
  default = {
    "terraform": "true", 
    "purpose": "",
    "environment": "stage"
  }
  description  = "tags for the bucket"
}

variable "script_location" {
  type        = string
  default     = ""
  description = "S3 bucket uri path to the script file."
}

variable "python_version" {
  type        = number
  default     = 3
  description = "The python version to use"

  validation {
    condition = contains([2,3], var.python_version)
    error_message = "version must either be 2 or 3"
  }
}

variable "job_language" {
  type        = string
  default     = "python"
  description = "The default programming language to use."
}

variable "enable_logging_cloudwatch" {
  type        = bool
  default     = true
  description = "Enable realtime logging for the glue job."
}

variable "enable_spark_ui" {
  type        = bool
  default     = false
  description = "Enable using Spark UI for monitoring this job."
}

variable "spark_event_logs_path" {
  type        = bool
  default     = false
  description = "The log path for for spark UI."
}

variable "create_trigger" {
  type        = bool
  default     = false
  description = "specify true to create trigger for the job."
}

variable "trigger_name" {
  type        = string
  default     = ""
  description = "name to give trigger."
}

variable "trigger_cron_schedule" {
  type        = string
  default     = ""
  description = "cron schedule for trigger job."
}

variable "trigger_type" {
  type        = string
  default     = "SCHEDULED"
  description = "trigger type for the job."
}

variable "start_trigger_on_creation" {
  type        = bool
  default     = false
  description = "start scheduled trigger on creation."
}