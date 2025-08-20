variable "region" {
   default = "eu-west-2"
   description = "Default environment region"
}

variable "cred_files" {
   default = "~/.aws/credentials"
}

variable "env" {
   type = string
   description = "Environment (dev/staging/prod)"
   default = "dev"
}

variable "bucket_name" {
   type = string
   default = "fruitbox-bucket"
}

variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}
