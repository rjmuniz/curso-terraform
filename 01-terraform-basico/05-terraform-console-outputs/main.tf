variable "file_path" {  
  type    = string
  default = "arquivo-hello-world.txt"
}


provider "aws" {
    profile = "default"
    region = "us-east-1"
}

# create bucket
resource "aws_s3_bucket" "firstbucket" {
    bucket  = "my-tf-test-bucket-rjmuniz"
    acl     = "private"

    tags = {
      Name          = "My bucket"
      Environment   = "Dev"
    }
}

# create bucket object
resource "aws_s3_bucket_object" "firstbucketobject" {
  bucket  = aws_s3_bucket.firstbucket.id
  key     = "hello world"
  source  = var.file_path
  etag    = md5(file(var.file_path))
}

output "firstbucket" {
  value = aws_s3_bucket.firstbucket.id
}

output "etag" {
  value = aws_s3_bucket_object.firstbucketobject.etag
}

/* 
$ terraform console
  > aws_s3_bucket_object.firstbucketobject.etag
  "567cdbb009169afdf7b2ed77dc642888"
  > aws_s3_bucket_object.firstbucketobject.bucket
  "my-tf-test-bucket-rjmuniz"
  > aws_s3_bucket_object.firstbucketobject.id
  "hello world"
   */
