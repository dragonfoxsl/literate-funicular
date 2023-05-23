# Public route tables

resource "aws_route_table" "staging_application_public_rt" {
  vpc_id = aws_vpc.staging_application_vpc.id

  tags = {
    Name = "[test]public-rt"

  }
}

resource "aws_route" "staging_application_public_rt_igw_route" {
  route_table_id         = aws_route_table.staging_application_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.staging_application_igw.id
  depends_on = [
    aws_route_table.staging_application_public_rt
  ]
}

# NAT Route table

resource "aws_route_table" "staging_application_nat_rt" {
  vpc_id = aws_vpc.staging_application_vpc.id

  tags = {
    Name = "[test]nat-rt"

  }
}

resource "aws_route" "staging_application_nat_rt_igw_route" {
  route_table_id         = aws_route_table.staging_application_nat_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.staging_application_igw.id
  depends_on = [
    aws_route_table.staging_application_nat_rt
  ]
}


# EC2 Private route table

resource "aws_route_table" "staging_application_ec2_private_rt" {
  vpc_id = aws_vpc.staging_application_vpc.id

  tags = {
    Name = "[test]private-rt"

  }
}

resource "aws_route" "staging_application_ec2_private_rt_igw_route" {
  route_table_id         = aws_route_table.staging_application_ec2_private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.staging_application_ngw_1a.id
  depends_on = [
    aws_route_table.staging_application_ec2_private_rt
  ]
}