resource "aws_vpc" "case6_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "case6_private_subnet" {
  vpc_id            = aws_vpc.case_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1"
}

# Create route table
resource "aws_route_table" "case6_route_table" {
  vpc_id = aws_vpc.case6_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "case6_internet_gateway_id"
  
}

# Associate route table with subnet
resource "aws_route_table_association" "case6_subnet_association" {
  subnet_id      = aws_subnet.case6_private_subnet.id
  route_table_id = aws_route_table.case_route_table.id
}

# Create Network ACL
resource "aws_network_acl" "case6_acl" {
  vpc_id = aws_vpc.case6_vpc.id
}

# Allow necessary traffic
resource "aws_network_acl_rule" "allow_inbound" {
  network_acl_id = aws_network_acl.case6_acl.id
  rule_number    = 100
  protocol       = "all"
  rule_action    = "allow"
  egress         = false
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "allow_outbound" {
  network_acl_id = aws_network_acl.case6_acl.id
  rule_number    = 100
  protocol       = "all"
  rule_action    = "allow"
  egress         = true
  cidr_block     = "0.0.0.0/0"
}
