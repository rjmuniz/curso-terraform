provider "aws" {
    profile = "default"
    region = "us-east-1"
}

resource "aws_s3_bucket" "FirstBucket" {
    bucket  = "my-tf-test-bucket-rjmuniz"
    acl     = "private"

    tags = {
      Name          = "My bucket"
      Environment   = "Dev"
    }
  
}