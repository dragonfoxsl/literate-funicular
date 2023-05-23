resource "aws_s3_bucket" "data-upload" {
  bucket = "staging-application-upload-data"

  tags = {
    Name        = "staging-application-upload-data"
    "component" = "application_block_storage"
  }
}

