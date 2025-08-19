output "vpc_id" {
   value = aws_vpc.fruitbox_vpc.id
}

output "fruitbox_public_subnet_id" {
   value = aws_subnet.fruitbox_public_subnet.id
}

output "fruitbox_private_subnet1" {
   value = aws_subnet.fruitbox_private_subnet1.id
}

output "fruitbox_private_subnet2" {
   value = aws_subnet.fruitbox_private_subnet2.id
}

output "fruitbox_private_subnet3" {
   value = aws_subnet.fruitbox_private_subnet3.id
}

output "availability_zones" {
   value = data.aws_availability_zones.vpc_availability_zones.names
}

output "db_subnet_group_name" {
   value = aws_db_subnet_group.fruitbox_subnet_group.id
}