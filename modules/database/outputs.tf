output "db_instance_info" {
   value = {
      address = aws_db_instance.fruitbox_db.address
      port    = aws_db_instance.fruitbox_db.port
      username = aws_db_instance.fruitbox_db.username
      db_name     = aws_db_instance.fruitbox_db.db_name
      endpoint = aws_db_instance.fruitbox_db.endpoint
   }
}