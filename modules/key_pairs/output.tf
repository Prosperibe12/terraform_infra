output "key_pair_name" {
   value = aws_key_pair.fruitebox_keypair.key_name
}

output "fruitbox_private_key_pem" {
  value     = tls_private_key.fruitbox_private_key.private_key_pem
  sensitive = true
}