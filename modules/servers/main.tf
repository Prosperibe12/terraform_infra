// ami data source
data "aws_ami" "ami_data" {
   most_recent = true
   owners      = [var.ami_owners]
   filter {
      name   = "name"
      values = [var.ami_filter]
   }
}

// webserver instance resource
resource "aws_instance" "fruitbox_webserver" {
   ami           = data.aws_ami.ami_data.id
   instance_type = var.env == "prod" ? var.server_instance_type : "t2.micro"
   key_name      = var.key_pair_name
   vpc_security_group_ids = [var.security_group_id]
   subnet_id     = var.webserver_subnet_id

   tags = {
      Name = "${var.webserver_name}-${var.env}"
      Environment = var.env
   }
}

// appserver instance resource
resource "aws_instance" "fruitbox_appserver" {
   ami           = data.aws_ami.ami_data.id
   instance_type = var.env == "prod" ? var.server_instance_type : "t2.micro"
   key_name      = var.key_pair_name
   vpc_security_group_ids = [var.appserver_security_group_id]
   subnet_id     = var.appserver_subnet_id

   tags = {
      Name = "${var.appserver_name}-${var.env}"
      Environment = var.env
   }
}