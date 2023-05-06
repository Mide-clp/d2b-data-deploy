terraform {
  backend "s3" {
    key            = "stage/workflow/glue/terraform.tfstate"
    bucket         = "mide-d2b-tf-backend"
    region         = "us-east-1"
    dynamodb_table = "mide-d2b-lock-backend"
    encrypt        = true
  }
}