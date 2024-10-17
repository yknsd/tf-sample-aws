resource "aws_s3_bucket" "example" {
  bucket = var.example_bucket_name
}

// バケット所有者の強制（デフォルト）. ACL無効
resource "aws_s3_bucket_ownership_controls" "example_bucket_ownership_controls" {
  bucket = aws_s3_bucket.example.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}

//resource "aws_s3_bucket_lifecycle_configuration" "lifecycle_conf_example" {
//  bucket = aws_s3_bucket.example.id
//
//  rule {
//    id = "lifecycle-rule-1"
//
//    # ... other transition/expiration actions ...
//
//    status = "Enabled"
//  }
//}
