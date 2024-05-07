resource "aws_s3_bucket" "case6_bucket" {
  bucket = "case6_bucket_871996"
  acl    = "private"

  # Block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 Bucket Policy
resource "aws_s3_bucket_policy" "case6_bucket_policy" {
  bucket = aws_s3_bucket.case6_bucket_871996.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : "*",
      "Action" : "s3:GetObject",
      "Resource" : "arn:aws:s3:::case6_bucket_871996/*",
      "Condition" : {
        "StringEquals" : {
          "aws:SourceVpc" : "vpc-09daf5961f1d89e76"
        }
      }
    }]
  })
}
