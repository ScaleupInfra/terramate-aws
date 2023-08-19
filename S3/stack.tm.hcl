stack {
  name        = "S3"
  description = "S3"
  id          = "5eae4d6f-533e-48e5-bfa2-6cbc68a7c4d6"
}

globals {
  aws_provider_version = "4.27.0"
  aws_region           = "ap-northeast-1"
}
generate_hcl "provider.tf" {
  content {
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = global.aws_provider_version
        }
      }
    }
    provider "aws" {
      region = global.aws_region
    }
  }
}
generate_hcl "main.tf" {
  content {
    resource "aws_s3_bucket" "Infrasity" {
      acl = "private"
      tags {
        name = "S3"
      }
      versioning {
        enabled = true
      }
      lifecycle {
        rule {
          status = "Enabled"
          transition {
            days          = 30
            storage_class = "STANDARD_IA"
          }
          transition {
            days          = 300
            storage_class = "GLACIER"
          }
          expiration {
            days = 365
          }
        }
      }
    }
  }
}
