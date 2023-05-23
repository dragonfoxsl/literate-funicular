

resource "aws_network_acl" "staging_application_public" {
  vpc_id = aws_vpc.staging_application_vpc.id

  subnet_ids = [for subnet_id in aws_subnet.staging_application_public_subnets.*.id : subnet_id]

  tags = {
    Name = "[test]public-nacl"

  }
}

resource "aws_network_acl_rule" "staging_application_public_allow_http_ingress" {
  network_acl_id = aws_network_acl.staging_application_public.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "staging_application_public_allow_https_ingress" {
  network_acl_id = aws_network_acl.staging_application_public.id
  rule_number    = 101
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "staging_application_public_allow_egress" {
  network_acl_id = aws_network_acl.staging_application_public.id
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  icmp_code      = 0
  icmp_type      = 0
}


resource "aws_network_acl" "staging_application_nat_public" {
  vpc_id = aws_vpc.staging_application_vpc.id

  subnet_ids = [for subnet_id in aws_subnet.staging_application_nat_public_subnets.*.id : subnet_id]

  tags = {
    Name = "[test]nat-public-nacl"

  }
}

resource "aws_network_acl_rule" "staging_application_nat_public_allow_http_ingress" {
  network_acl_id = aws_network_acl.staging_application_nat_public.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "staging_application_nat_public_allow_https_ingress" {
  network_acl_id = aws_network_acl.staging_application_nat_public.id
  rule_number    = 101
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "staging_application_nat_public_allow_egress" {
  network_acl_id = aws_network_acl.staging_application_nat_public.id
  rule_number    = 101
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  icmp_code      = 0
  icmp_type      = 0
}

resource "aws_network_acl" "staging_application_ec2_private" {
  vpc_id = aws_vpc.staging_application_vpc.id

  subnet_ids = [for subnet_id in aws_subnet.staging_application_ec2_private_subnets.*.id : subnet_id]

  tags = {
    Name = "[test]ec2-private-nacl"

  }
}

resource "aws_network_acl_rule" "staging_application_ec2_private_allow_ingress" {
  network_acl_id = aws_network_acl.staging_application_ec2_private.id
  rule_number    = 100
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.staging_application_vpc_cidr_block
  from_port      = 0
  to_port        = 0
  icmp_code      = 0
  icmp_type      = 0
}

resource "aws_network_acl_rule" "staging_application_ec2_private_allow_egress" {
  network_acl_id = aws_network_acl.staging_application_ec2_private.id
  rule_number    = 101
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.staging_application_vpc_cidr_block
  from_port      = 0
  to_port        = 0
  icmp_code      = 0
  icmp_type      = 0
}