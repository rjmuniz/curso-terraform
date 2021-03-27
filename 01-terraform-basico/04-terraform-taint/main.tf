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
resource "aws_s3_bucket_object" "FirstBucketObject" {
  bucket  = aws_s3_bucket.firstbucket.id
  key     = "hello world"
  source  = "arquivo-hello-world.txt"
}

#############
# eu altero o arquivo e marco ele para ser recriado com o comando taint
#
# $ terraform taint aws_s3_bucket_object.FirstBucketObject
# para desmarcar o taint usa o comando untaint
# $ terraform untaint aws_s3_bucket_object.FirstBucketObject
#
# depois o plan e apply