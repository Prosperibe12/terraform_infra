provider "aws" {
  region = var.region
  shared_credentials_files = [var.cred_files]
}