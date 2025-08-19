resource "tls_private_key" "fruitbox_private_key" {
   algorithm = var.tls_algorithm
}

resource "aws_key_pair" "fruitbox_key_pair"{
   key_name = var.key_name
   public_key = tls_private_key.fruitbox_private_key.public_key_openssh

   provisioner "local-exec" {
      command = "echo '${tls_private_key.fruitbox_private_key.private_key_openssh}' > '${path.root}/${var.key_name}.pem'"
   }
}