variable "ami_owners" {
   default = "self"
}

variable "env" {
   description = "Default project environment"
}

variable "ami_filter" {
   default = "smarteye-worker*"
}

variable "server_instance_type" {
   default = "t2.micro"
}

variable "webserver_name" {
   description = "webserver name"
}

variable "key_pair_name" {
   description = "value of the key pair name to be used for the webserver"
} 

variable "security_group_id" {
   description = "Security group ID for the webserver"
}

variable "webserver_subnet_id" {
   description = "Subnet ID for the webserver"
}

variable "appserver_name" {
   description = "Application server name"
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