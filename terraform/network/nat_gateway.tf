resource "aws_nat_gateway" "staging_application_ngw_1a" {
  allocation_id = aws_eip.staging_application_ngw_1a_eip.id
  subnet_id     = element(aws_subnet.staging_application_nat_public_subnets.*.id, 0)

  depends_on = [
    aws_internet_gateway.staging_application_igw,
    aws_eip.staging_application_ngw_1a_eip
  ]

  tags = {
    Name = "[test]ngw-1a"

  }
}

resource "aws_eip" "staging_application_ngw_1a_eip" {
  vpc = true

  depends_on = [aws_internet_gateway.staging_application_igw]

  tags = {
    Name = "[test]ngw-1a-eip"

  }
}
