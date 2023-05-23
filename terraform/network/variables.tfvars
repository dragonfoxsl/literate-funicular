resource_environment = "staging_application_network"
owner_team           = "devops"
application_name     = "test_tab"

# BASICS
account_number      = "XXXXXX"
region              = "us-west-2"
availability_zone_a = "us-west-2a"
availability_zone_b = "us-west-2b"
availability_zone_c = "us-west-2c"

# Network Configuration
# Each Subnet with 16 IPs (Minimum supported by AWS)

staging_application_vpc_cidr_block = "10.10.0.0/25"

staging_application_public_subnets_variables = [
  { subnet_name = "[test]ec2-public-1a", cidr_block = "10.10.0.0/28", availability_zone = "us-west-2a", type = "public" },
  { subnet_name = "[test]ec2-public-1b", cidr_block = "10.10.0.16/28", availability_zone = "us-west-2b", type = "public" },
]

staging_application_nat_public_subnets_variables = [
  { subnet_name = "[test]nat-public-1a", cidr_block = "10.10.0.32/28", availability_zone = "us-west-2a", type = "nat_public" },
]

staging_application_ec2_private_subnets_variables = [
  { subnet_name = "[test]ec2-private-1a", cidr_block = "10.10.10.48/28", availability_zone = "us-west-2a", type = "ec2_private" },
]