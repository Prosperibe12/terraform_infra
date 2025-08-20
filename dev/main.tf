provider "aws" {
   region = var.region
   shared_credentials_files = [var.cred_files]
}

locals {
   environment = "${var.env}"
   bucket_name = "${var.bucket_name}-${var.env}"
   appserver_name = "fruitbox-appserver"
   webserver_name = "fruitbox-webserver"
}

module "s3_bucket" {
   source = "../modules/s3_bucket"
   bucket_name = local.bucket_name
   bucket_tag_name = "fruitbox-project"
   bucket_tag_env = local.environment
}

module "key_key_pair" {
   source = "../modules/key_pair"
}

module "vpc" {
   source = "../modules/vpc"
   env = local.environment
   vpc_region = var.region
}

# module "security_group" {
#    source = "../modules/security_group"
#    env = local.environment
#    vpc_id = module.vpc.vpc_id
# }

# module "database" {
#    source = "../modules/database"
#    env = local.environment
#    subnet_group = module.vpc.db_subnet_group_name
#    db_username   = var.db_username
#    db_password   = var.db_password
#    sec_grp_id = module.security_group.dbserver_sg_id
# }

# module "ec2_instances" {
#    source                      = "../modules/servers"
#    key_pair_name               = module.key_key_pair.key_pair_name
#    security_group_id           = module.security_group.webserver_sg_id
#    appserver_security_group_id = module.security_group.appserver_sg_id
#    env                         = local.environment
#    webserver_name              = local.webserver_name
#    appserver_name              = local.appserver_name
#    webserver_subnet_id         = module.vpc.fruitbox_public_subnet_id
#    appserver_subnet_id         = module.vpc.fruitbox_private_subnet1
# }