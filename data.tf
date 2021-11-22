data "aws_caller_identity" "current" {}

output "account_idaa" {
  value = data.aws_caller_identity.current.account_id
}



locals {
    account_id = data.aws_caller_identity.current.account_id
}



output "account_id" {
  value = local.account_id
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "test-bucket-${local.account_id}"
}
