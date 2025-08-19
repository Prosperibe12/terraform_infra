terraform {
   cloud { 
      organization = "ProsperCloudOrg" 
      workspaces { 
         project = "TerraformCloud"
         name = "project_dev" 
      } 
   } 

   required_providers {
      aws = {
         source  = "hashicorp/aws"
         version = ">=4.5.0"
      }
   }
   required_version = "~>1.2"
}