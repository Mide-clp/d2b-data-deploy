variable "aws_region" {
  type         = string
  default      = "us-east-1"
  description  = "default region for deployment"
}

variable "ingestion_layer_job_name" {
  type        = string
  default     = "data_ingestion_source"
  description = "Default name for the glue job."
}

variable "ingestion_layer_role_name" {
  type        = string
  default     = "glue_ingestion_role"
  description = "role name for the IAM resource."
}

variable "ingestion_file_name" {
  type        = string
  default     = "glue/ingestion.py"
  description = "path to file in the bucket"
}

variable "ingestion_layer_job_tags" {
  type = map(string)
  default = {
    "terraform": "true", 
    "purpose": "data ingestion to raw layer",
    "environment": "stage"
  }
  description  = "tags for flue job"
}

variable "ingestion_layer_trigger_name" {
  type        = string
  default     = "ingestion_job_trigger"
  description = "name to give trigger."
}

variable "ingestion_layer_trigger_schedule" {
  type        = string
  default     = "cron(0 */6 * * ? *)"
  description = "cron schedule for trigger job."
}

variable "storage_s3_remote_state_backend" {
  type         = string
  default      = "s3"
  description  = "backend used"
} 

variable "storage_s3_remote_state_bucket" {
  type         = string
  default      = "mide-d2b-tf-backend"
  description  = "bucket where the remote state is located"
} 

variable "storage_s3_remote_state_bucket_key" {
  type         = string
  default      = "stage/storage/s3/terraform.tfstate"
  description  = "bucket key that point to the s3 storage backend"
}

variable "glue_ingestion_write_only_policy_action" {
  type         = list(string)
  default      = [ 
             "s3:PutObject"
          ]
  description  = "list of action policy to be assigned to the bucket"
}

variable "glue_ingestion_write_only_policy_effect" {
  type         = string
  default      = "Allow"
  description  = "The effects of the actions given"
}

variable "processing_layer_job_name" {
  type        = string
  default     = "data_processing_job"
  description = "Default name for the glue job."
}

variable "processing_layer_role_name" {
  type        = string
  default     = "glue_processing_job_role"
  description = "role name for the IAM resource."
}

variable "processing_file_name" {
  type        = string
  default     = "glue/processing.py"
  description = "path to file in the bucket"
}

variable "processing_layer_job_tags" {
  type = map(string)
  default = {
    "terraform": "true", 
    "purpose": "data processing from raw layer",
    "environment": "stage"
  }
  description  = "tags for flue job"
}

variable "processing_layer_trigger_name" {
  type        = string
  default     = "processing_job_trigger"
  description = "name to give trigger."
}

variable "processing_layer_trigger_schedule" {
  type        = string
  default     = "cron(0 6 * * ? *)"
  description = "cron schedule for trigger job."
}
