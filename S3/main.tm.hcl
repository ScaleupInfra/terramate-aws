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

generate_hcl "backend.tf" {
  content {
    terraform {
      backend "s3" {
        bucket     = "terraform-backend-state-file-s3"
        key        = "terraform-S3/terraform.tfstate"
        region     = "ap-northeast-1"
        encrypt    = true
      }
    }
  }
}