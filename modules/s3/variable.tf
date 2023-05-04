variable "bucket_name" {
  type         = string
  description  = "name to give the bucket"
}

variable "bucket_purpose" {
  type         = string
  description  = "default region for deployment"
}

variable "env" {
  type         = string
  description  = "The environment the bucket is deployed to"
}

variable "bucket_policy_actions" {
  type         = list(string)
  default      = [ 
             "s3:DeleteObject",
             "s3:GetObject",
             "s3:ListBucket",
             "s3:PutObject"
          ]
  description  = "list of IAM action policy to be assigned to the bucket"
}

variable "bucket_policy_effect" {
  type         = string
  default      = "Allow"
  description  = "The effects of the actions given"
}

variable "bucket_iam_principal_user_identifiers" {
  type         = list(string)
  default      = [""]
  description  = "list of arn to give permission to interact with the bucket"
}

variable "bucket_policy_sid" {
  type         = string
  default      = "AllowUsers"
  description  = "The effects of the actions given"
}