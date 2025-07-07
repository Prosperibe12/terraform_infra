output "web_security_group_id" {
  value = aws_security_group.fruitbox_webserver_sg.id
}

output "app_security_group_id" {
  value = aws_security_group.fruitbox_appserver_sg.id
}