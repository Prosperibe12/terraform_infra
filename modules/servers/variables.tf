variable "ami_owners" {
   default = "amazon"
}

variable "ami_filter" {
   default = "amzn2-ami-hvm*"
}

variable "server_instance_type" {
   default = "t2.micro"
}

variable "webserver_name" {
   default = "fruitbox-webserver"
}

variable "webserver_environment" {
   default = "dev"
}

variable "key_pair_name" {
   description = "value of the key pair name to be used for the webserver"
} 

variable "security_group_id" {
   description = "Security group ID for the webserver"
}

variable "subnet_id" {
   description = "Subnet ID for the webserver"
}

variable "appserver_name" {
   default = "fruitbox-appserver"
}

variable "appserver_environment" {
   default = "dev"
}


variable "appserver_security_group_id" {
   description = "Security group ID for the webserver"
}

variable "appserver_subnet_id" {
   description = "Subnet ID for the webserver"
}