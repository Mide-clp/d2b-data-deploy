variable "bucket_name" {
  type         = string
  default      = "d2b-mide-raw-layer"
  description  = "name to give the bucket"
}

variable "bucket_tags" {
  type    = map()
  default = {
    "terraform": "true", 
    "purpose": "raw layer",
    "environment": "stage"
  }
  description  = "tags for the bucket"
}

variable "bucket_arn" {
  type         = list(string)
  description  = "list of arn to give permission to interact with the bucket"
}
