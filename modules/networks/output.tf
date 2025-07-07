output "vpc_id" {
   description = "The ID of the VPC created for the infrastructure"
   value       = aws_vpc.fruitbox_vpc.id
}

output "private_subnet_id" {
   description = "The ID of the private subnet created for the infrastructure"
   value       = aws_subnet.fruitbox_private_subnet.id
}

output "public_subnet_id" {
   description = "The ID of the public subnet created for the infrastructure"
   value       = aws_subnet.fruitbox_public_subnet.id
}