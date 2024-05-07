resource "aws_s3_bucket_lifecycle_configuration" "case6_bucket_lifecycle" {
  bucket = aws_s3_bucket.case6_bucket_871996.id

  rule {
    id     = "glacier_rule"
    prefix = ""
    enabled = true

    transition {
      days          = 30
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }
}
