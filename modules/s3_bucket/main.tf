resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "fruitbox_bucket" {
   bucket = "${var.bucket_name}-${random_id.suffix.hex}"

   tags = {
      Name = var.bucket_tag_name
      Environment = var.bucket_tag_env
   }
}

resource "aws_s3_bucket_versioning" "fruitbox_bucket_versioning" {
   bucket = aws_s3_bucket.fruitbox_bucket.id
   versioning_configuration {
      status = var.bucket_versioning
   }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "fruitbox_bucket_encryption" {
   bucket = aws_s3_bucket.fruitbox_bucket.id

   rule {
         apply_server_side_encryption_by_default {
         sse_algorithm = var.bucket_encryption
      }
   }
}