resource "aws_cloudtrail" "my_trail" {
  name                          = "case6_trail"
  s3_bucket_name                = "casre6_bucket-871996"
  include_global_service_events = true
}
