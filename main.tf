provider "aws" {
  region  = var.region
  profile = "default"
#  assume_role {
  #  role_arn = var.aws_role
#  }
}

