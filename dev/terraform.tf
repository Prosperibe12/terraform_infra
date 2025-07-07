//Terraform configuration
terraform {
  # cloud {
  #   organization = "ProsperCloudOrg"
  #   workspaces {
  #     name = "fruitbox_dev"
  #   }
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
  required_version = ">=0.12"
}
