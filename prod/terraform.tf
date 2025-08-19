terraform {
   cloud {
      organization = "ProsperCloudOrg"
      workspaces {
         project = "Fruitbox"
         name = "fruitbox_prod" 
      }
   }
   required_providers {
      aws = {
         source = "hashicorp/aws"
         version = ">=5.0.0"
      }
   }
   required_version = ">=1.2"
}