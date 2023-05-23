terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.39"
    }
  }

  # Backend is configured in a different AWS region.
  backend "s3" {
    bucket               = "terraform-staging-environment"
    workspace_key_prefix = "bisina/staging_application"
    key                  = "network/network.tfstate"
    region               = "eu-central-1"
    dynamodb_table       = "eu-central-1-terraform-locks"
    encrypt              = true
  }
}

provider "aws" {
  region = var.region

  # Authentication Access Key and Secret Key is provided as environment variables

  default_tags {
    tags = {
      "environment" = "${var.resource_environment}"
      "team"        = "${var.owner_team}"
      "application" = "${var.application_name}"
    }
  }
}
