data "aws_caller_identity" "current" {}
data "aws_region" "current" {}


locals {
  # Changed .name to .region at the very end
  final_bucket_name = var.bucket_name != null ? var.bucket_name : format("my-bucket-%s-%s-an", data.aws_caller_identity.current.account_id, data.aws_region.current.region)
}

resource "aws_s3_bucket" "s3_bucket_1" {
  bucket           = local.final_bucket_name
  bucket_namespace = "account-regional"

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    Name        = local.final_bucket_name
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "s3_bucket_1_versioning" {
  bucket = aws_s3_bucket.s3_bucket_1.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_1" {
  bucket = aws_s3_bucket.s3_bucket_1.id

  rule {
    bucket_key_enabled = false

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
