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