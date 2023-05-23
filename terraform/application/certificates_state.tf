data "terraform_remote_state" "certificates" {
  backend = "s3"
  config = {
    bucket = "terraform-staging-environment"
    key    = "bisina/certificates/certificates.tfstate"
    region = "eu-central-1"
  }
}

locals {
  staging_test_certificate_arn = data.terraform_remote_state.certificates.outputs.staging_test_certificate_arn.arn
}
