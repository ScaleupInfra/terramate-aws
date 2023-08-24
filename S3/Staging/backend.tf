// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "terraform-backend-state-file-s3"
    encrypt = true
    key     = "terraform-S3/terraform.tfstate"
    region  = "ap-northeast-1"
  }
}
