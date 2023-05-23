# S3 endpoint to direct S3 traffic within the VPC

resource "aws_vpc_endpoint" "staging_application_s3_vpce" {
  vpc_id       = aws_vpc.staging_application_vpc.id
  service_name = "com.amazonaws.${var.region}.s3"

  tags = {
    Name = "[test]s3-vpce"
  }
}

resource "aws_vpc_endpoint_route_table_association" "staging_application_s3_vpce_assoc_ec2_private_rt" {
  vpc_endpoint_id = aws_vpc_endpoint.staging_application_s3_vpce.id
  route_table_id  = aws_route_table.staging_application_ec2_private_rt.id
}