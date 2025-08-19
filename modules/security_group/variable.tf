// Variables for securiy group
variable "vpc_id" {
   description = "VPC ID where the security group will be created"
}

variable "env" {
   type = string
}

variable "webserver_secgrp_name" {
   type = string
   default  = "fruitbox-webserver"
}

variable "webserver_sec_grp_name" {
   type = string
   default  = "fruitbox_webserver_sec_grp"
}

variable "webserver_ingress_rules" {
   default = [
      {"protocol" = "tcp", "from_port" = 80, "cidr_blocks" = ["0.0.0.0/0"]},
      {"protocol" = "tcp", "from_port" = 22, "cidr_blocks" = ["0.0.0.0/0"]}
   ]
}

variable "appserver_sec_grp_name" {
   type = string
   default     = "fruitbox_appserver_sec_grp"
}

variable "appserver_secgrp_name" {
   type = string
   default  = "fruitbox-appserver"
}

variable "dbserver_sec_grp_name" {
   type = string
   default     = "fruitbox_dbserver_sec_grp"
}

variable "dbserver_secgrp_name" {
   type = string
   default  = "fruitbox-dbserver"
}