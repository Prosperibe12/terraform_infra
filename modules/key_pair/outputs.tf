output "key_pair_name" {
  value = aws_key_pair.fruitbox_key_pair.key_name
}

output "private_key_pair" {
  value = tls_private_key.fruitbox_private_key.private_key_pem
  sensitive = true
}
