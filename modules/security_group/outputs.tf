output "webserver_sg_id" {
   value = aws_security_group.fruitbox_webserver_sg.id
}

output "appserver_sg_id" {
   value = aws_security_group.fruitbox_appserver_sg.id
}

output "dbserver_sg_id" {
   value = aws_security_group.fruitbox_dbserver_sg.id
}