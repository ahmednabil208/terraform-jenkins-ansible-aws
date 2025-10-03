# Declare S3 backend
terraform {
  backend "s3" {
    bucket         = "terraform-s3-ann"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "statefile-lock-table"
    encrypt        = true
  }
}



# Note: variables can not be used in backend file
