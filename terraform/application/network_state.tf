# Obtain resource details from the network section
data "terraform_remote_state" "staging_application_network_state" {
  backend = "s3"
  config = {
    bucket = "terraform-staging-prod-management-state"
    key    = "devops/staging_application/network/network.tfstate"
    region = "eu-central-1"
  }
}

locals {
  staging_application_vpc                     = data.terraform_remote_state.staging_application_network_state.outputs.staging_application_vpc
  staging_application_vpc_public_subnets      = data.terraform_remote_state.staging_application_network_state.outputs.staging_application_public_subnets
  staging_application_vpc_ec2_private_subnets = data.terraform_remote_state.staging_application_network_state.outputs.staging_application_ec2_private_subnets
}
