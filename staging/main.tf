provider "aws" {
   region = var.region
   shared_credentials_files = [ var.cred_files ]
}

locals {
   environment = "${var.env}"
   bucket_name = "${var.bucket_name}-${var.env}"
}

module "s3_bucket" {
   source = "../modules/s3_bucket/"
   bucket_name = local.bucket_name
   bucket_tag_name = "fruitbox-project"
   bucket_tag_env = local.environment
}

module "key_key_pair" {
   source = "../modules/key_pair/"
}

module "vpc" {
   source = "../modules/vpc/"
   env = local.environment
   vpc_region = var.region
}

module "security_group" {
   source = "../modules/security_group"
   env = local.environment
   vpc_id = module.vpc.vpc_id
}
