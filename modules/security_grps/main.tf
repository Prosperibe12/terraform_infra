// Security Group Configuration

// security group for public access to the web server
resource "aws_security_group" "fruitbox_webserver_sg" {
   name        = "fruitbox_web_sg"
   description = "Security group for web server access"
   vpc_id      = var.vpc_id
   // ingress rules
   dynamic ingress {
      for_each = var.webserver_ingress_rules
      content {
         from_port   = ingress.value.from_port
         to_port     = ingress.value.from_port
         protocol    = ingress.value.protocol
         cidr_blocks = ingress.value.cidr_blocks
      }
   }
   // egress rules
   egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1" // all protocols
      cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
      Name = var.webserver_sec_grp_name
   }
}

// security group for application server
resource "aws_security_group" "fruitbox_appserver_sg" {
   name        = "fruitbox_app_sg"
   description = "Security group for app server access"
   vpc_id      = var.vpc_id
   tags = {
      Name = var.appserver_sec_grp_name
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

resource "aws_vpc_security_group_egress_rule" "fruitbox_appserver_egress" {
  security_group_id = aws_security_group.fruitbox_appserver_sg.id

  cidr_ipv4    = "0.0.0.0/0"
  from_port    = 0
  ip_protocol  = "-1"
  to_port      = 0
}