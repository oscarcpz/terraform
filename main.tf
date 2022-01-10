terraform {
  required_version = ">1.1.0"
}

provider "aws" {
  region = var.region
  allowed_account_ids = [ var.account_id ]
}