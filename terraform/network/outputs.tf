# Staging Application Network Outputs

output "staging_application_vpc" {
  value = aws_vpc.staging_application_vpc
}

output "staging_application_public_subnets" {
  value = aws_subnet.staging_application_public_subnets
}

output "staging_application_ec2_private_subnets" {
  value = aws_subnet.staging_application_ec2_private_subnets
}

output "staging_application_ec2_private_rt" {
  value = aws_route_table.staging_application_ec2_private_rt
}

output "staging_application_ec2_private_nacl" {
  value = aws_network_acl.staging_application_ec2_private
}