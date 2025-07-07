// provider configuration
provider "aws" {
  region                   = var.region
  shared_credentials_files = [var.cred_files]
}

// networks module configuration 
module "project_networks" {
  source = "../modules/networks"
}

// security groups module configuration
module "project_security_groups" {
  source = "../modules/security_grps"
  vpc_id = module.project_networks.vpc_id
}

// key pairs module configuration
module "project_key_pairs" {
  source = "../modules/key_pairs"
}

// servers module configuration
module "project_webserver" {
  source                      = "../modules/servers"
  key_pair_name               = module.project_key_pairs.key_pair_name
  security_group_id           = module.project_security_groups.web_security_group_id
  subnet_id                   = module.project_networks.public_subnet_id
  appserver_security_group_id = module.project_security_groups.app_security_group_id
  appserver_subnet_id         = module.project_networks.private_subnet_id
}
