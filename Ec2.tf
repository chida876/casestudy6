resource "aws_instance" "case6_instance" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id
  iam_instance_profile = aws_iam_role.ec2_role.name
}
