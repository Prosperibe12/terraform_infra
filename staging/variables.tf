variable "region" {
   default = "us-east-1"
   description = "Default environment region"
}

variable "cred_files" {
   default = "~/.aws/credentials"
}

variable "env" {
   type = string
   description = "Environment (dev/staging/prod)"
   default = "staging"
}

variable "bucket_name" {
   default = "fruitbox-bucket"
}