variable "resource_environment" {
  description = "Resource Deployment Environment"
  type        = string
}

variable "owner_team" {
  description = "Resource Owner"
  type        = string
}

variable "application_name" {
  description = "Application Name"
  type        = string
}


variable "account_number" {
  description = "AWS Account Number"
  type        = string
}

variable "region" {
  description = "AWS Deployment Region"
  type        = string
}

variable "availability_zone_a" {
  description = "AWS Availability Zone a"
  type        = string
}

variable "availability_zone_b" {
  description = "AWS Availability Zone b"
  type        = string
}

variable "availability_zone_c" {
  description = "AWS Availability Zone c"
  type        = string
}

# Staging Application VPC

variable "staging_application_vpc_cidr_block" {
  description = "Staging Application VPC CIDR block"
  type        = string
}

variable "staging_application_public_subnets_variables" {
  description = "Staging Application EC2 Public Subnet variables"
  type        = list(any)
}

variable "staging_application_nat_public_subnets_variables" {
  description = "Staging Application NAT Public Subnet variables"
  type        = list(any)
}

variable "staging_application_ec2_private_subnets_variables" {
  description = "Staging Application EC2 Private Subnet variables"
  type        = list(any)
}