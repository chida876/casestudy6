resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = aws_vpc.my_vpc.id
  service_name      = "com.amazonaws.your_region.s3"
  route_table_ids   = [aws_route_table.my_route_table.id]
  policy            = <<POLICY
{
  "Statement": [{
    "Action": "*",
    "Effect": "Allow",
    "Resource": "*",
    "Principal": "*"
  }]
}
POLICY
}
