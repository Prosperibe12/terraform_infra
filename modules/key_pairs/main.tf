// key-pair configuration 

// generate a tls private key
resource "tls_private_key" "fruitbox_private_key" {
   algorithm = "RSA"
}

// create a key pair
resource "aws_key_pair" "fruitebox_keypair" {
   key_name   = var.key_pair_name
   public_key = tls_private_key.fruitbox_private_key.public_key_openssh
   provisioner "local-exec" {
     command = "echo '${tls_private_key.fruitbox_private_key.private_key_pem}' > ${path.root}/${var.key_pair_name}.pem"
   }
}