// RDS Configuration

resource "aws_db_instance" "fruitbox_db" {
  allocated_storage    = 10
  db_name              = "${var.db_name}${var.env}"
  engine               = var.db_type
  engine_version       = "8.0"
  instance_class       = var.db_instance
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [ var.sec_grp_id ]
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = var.subnet_group
  skip_final_snapshot  = true
}