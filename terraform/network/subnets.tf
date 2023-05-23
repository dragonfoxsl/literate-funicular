# Public Subnets for ALB
resource "aws_subnet" "staging_application_public_subnets" {
  count             = length(var.staging_application_public_subnets_variables)
  vpc_id            = aws_vpc.staging_application_vpc.id
  cidr_block        = var.staging_application_public_subnets_variables[count.index].cidr_block
  availability_zone = var.staging_application_public_subnets_variables[count.index].availability_zone

  tags = {
    Name = "${var.staging_application_public_subnets_variables[count.index].subnet_name}"
    Type = "${var.staging_application_public_subnets_variables[count.index].type}"

  }
}

resource "aws_route_table_association" "staging_application_public_subnets_association" {
  count = length(var.staging_application_public_subnets_variables)

  subnet_id      = element(aws_subnet.staging_application_public_subnets.*.id, count.index)
  route_table_id = aws_route_table.staging_application_public_rt.id

  depends_on = [
    aws_subnet.staging_application_public_subnets
  ]
}

# NAT Public Subnet
resource "aws_subnet" "staging_application_nat_public_subnets" {
  count             = length(var.staging_application_nat_public_subnets_variables)
  vpc_id            = aws_vpc.staging_application_vpc.id
  cidr_block        = var.staging_application_nat_public_subnets_variables[count.index].cidr_block
  availability_zone = var.staging_application_nat_public_subnets_variables[count.index].availability_zone

  tags = {
    Name = "${var.staging_application_nat_public_subnets_variables[count.index].subnet_name}"
    Type = "${var.staging_application_nat_public_subnets_variables[count.index].type}"

  }
}

resource "aws_route_table_association" "staging_application_nat_public_subnets_association" {
  count = length(var.staging_application_nat_public_subnets_variables)

  subnet_id      = element(aws_subnet.staging_application_nat_public_subnets.*.id, count.index)
  route_table_id = aws_route_table.staging_application_nat_rt.id

  depends_on = [
    aws_subnet.staging_application_nat_public_subnets
  ]
}

# EC2 Private Subnet
resource "aws_subnet" "staging_application_ec2_private_subnets" {
  count             = length(var.staging_application_ec2_private_subnets_variables)
  vpc_id            = aws_vpc.staging_application_vpc.id
  cidr_block        = var.staging_application_ec2_private_subnets_variables[count.index].cidr_block
  availability_zone = var.staging_application_ec2_private_subnets_variables[count.index].availability_zone

  tags = {
    Name = "${var.staging_application_ec2_private_subnets_variables[count.index].subnet_name}"
    Type = "${var.staging_application_ec2_private_subnets_variables[count.index].type}"

  }
}

resource "aws_route_table_association" "staging_application_ec2_private_subnets_association" {
  count = length(var.staging_application_ec2_private_subnets_variables)

  subnet_id      = element(aws_subnet.staging_application_ec2_private_subnets.*.id, count.index)
  route_table_id = aws_route_table.staging_application_ec2_private_rt.id

  depends_on = [
    aws_subnet.staging_application_ec2_private_subnets
  ]
}