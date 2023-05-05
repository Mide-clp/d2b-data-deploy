variable "bucket_name" {
  type         = string
  description  = "name to give the bucket"
}

variable "bucket_tags" {
  type = map(string)
  default = {
    "terraform": "true", 
    "purpose": "",
    "environment": "stage"
  }
  description  = "tags for the bucket"
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

variable "bucket_policy_sid" {
  type         = string
  default      = "AllowUsers"
  description  = "The effects of the actions given"
}


variable "bucket_iam_principal_user_identifiers" {
  type         = list(string)
  description  = "list of arn to give permission to interact with the bucket"
}

