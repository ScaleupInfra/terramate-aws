// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "aws_s3_bucket" "Infrasity" {
  acl = "private"
  tags = {
    name    = "S3"
    made_by = "Scaleup-Infra"
  }
  versioning {
    enabled = true
  }
}
