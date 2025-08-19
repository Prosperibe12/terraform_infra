// security group for public access to the web server
resource "aws_security_group" "fruitbox_webserver_sg" {

   name        = "${var.webserver_secgrp_name}-${var.env}"
   description = "Security group for web server access"
   vpc_id      = var.vpc_id

   dynamic ingress {
      for_each = var.webserver_ingress_rules
      content {
         from_port   = ingress.value.from_port
         to_port     = ingress.value.from_port
         protocol    = ingress.value.protocol
         cidr_blocks = ingress.value.cidr_blocks
      }
   }

   egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
      Name = "${var.webserver_sec_grp_name}-${var.env}"
   }
}

// security group for application server
resource "aws_security_group" "fruitbox_appserver_sg" {

   name        = "${var.appserver_secgrp_name}-${var.env}"
   description = "Security group for app server access"
   vpc_id      = var.vpc_id

   tags = {
      Name = "${var.appserver_sec_grp_name}-${var.env}"
   }
}

// ingress rule for appserver security group
resource "aws_vpc_security_group_ingress_rule" "fruitbox_appserver_ingress" {

   security_group_id = aws_security_group.fruitbox_appserver_sg.id

   referenced_security_group_id = aws_security_group.fruitbox_webserver_sg.id
   from_port   = 80
   ip_protocol = "tcp"
   to_port     = 80
}

// ingress for db port
resource "aws_vpc_security_group_ingress_rule" "fruitbox_appserver_db_ingress" {
   security_group_id = aws_security_group.fruitbox_appserver_sg.id

   referenced_security_group_id = aws_security_group.fruitbox_dbserver_sg.id
   from_port   = 3306
   ip_protocol = "tcp"
   to_port     = 3306
}

// security group for database server
resource "aws_security_group" "fruitbox_dbserver_sg" {

   name        = "${var.dbserver_secgrp_name}-${var.env}"
   description = "Security group for db server access"
   vpc_id      = var.vpc_id

   tags = {
      Name = "${var.dbserver_sec_grp_name}-${var.env}"
   }
}

// ingress rule for dbserver security group
resource "aws_vpc_security_group_ingress_rule" "fruitbox_dbserver_ingress" {

   security_group_id = aws_security_group.fruitbox_dbserver_sg.id

   referenced_security_group_id = aws_security_group.fruitbox_appserver_sg.id
   from_port   = 3306
   ip_protocol = "tcp"
   to_port     = 3306
}
