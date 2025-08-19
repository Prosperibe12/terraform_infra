variable "db_type" {
   type = string
   default = "mysql"
}

variable "subnet_group" {
   type = string
}

variable "env" {
   description = "Project environment"
}

variable "db_name" {
   type = string
   default = "fruitboxdb"
}

variable "db_instance" {
   type = string
   default = "db.t3.micro"
}

variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}


variable "sec_grp_id" {
   type = string
   sensitive = true
}