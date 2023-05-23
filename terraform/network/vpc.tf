# VPC Configuration
resource "aws_vpc" "staging_application_vpc" {
  cidr_block           = var.staging_application_vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "[test]application-vpc"

  }
}

# Configuring the default resources
resource "aws_default_route_table" "staging_application_vpc_default_rt" {
  default_route_table_id = aws_vpc.staging_application_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.staging_application_igw.id
  }

  tags = {
    Name = "[test]public-rt"

  }
}

resource "aws_default_network_acl" "staging_application_vpc_default_acl" {
  default_network_acl_id = aws_vpc.staging_application_vpc.default_network_acl_id
  subnet_ids             = []

  tags = {
    Name = "[test]default-nacl"

  }
}

resource "aws_default_security_group" "staging_application_vpc_default_sg" {
  vpc_id = aws_vpc.staging_application_vpc.id

  tags = {
    Name = "[test]default-sg"

  }
}
