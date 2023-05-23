resource "aws_internet_gateway" "staging_application_igw" {
  vpc_id = aws_vpc.staging_application_vpc.id

  tags = {
    Name = "[test]igw"

  }
}
