output "name" {
  value = aws_s3_bucket.this.id
}

output "object" {
  value = aws_s3_bucket_object.this.*.key
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "object_arn" {
  value = aws_s3_bucket_object.this.*.arn
}