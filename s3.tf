resource "aws_s3_bucket" "s3main" {
  bucket = "storing-the-backend-data"

  
  
}

resource "aws_s3_bucket_versioning" "name" {
    bucket = aws_s3_bucket.s3main.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "serverside" {
  bucket = aws_s3_bucket.s3main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_dynamodb_table" "name" {
  name = "lock-state-for-Terraform"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}