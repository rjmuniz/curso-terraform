# bucket de logs
resource "aws_s3_bucket" "log" {
  bucket = "${var.domain}-logs"
  acl    = "log-delivery-write"
}

# bucket de redirect de www -> sem www
resource "aws_s3_bucket" "redirect" {
    bucket = "www.${var.domain}"
    acl = "public-read"
    
    
    website {
      redirect_all_requests_to = var.domain
    }
}

# bucket do site
resource "aws_s3_bucket" "site" {
  bucket = var.domain
  acl = "public-read"
  policy = data.template_file.policy.rendered

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  logging {
    target_bucket = aws_s3_bucket.log.bucket
    target_prefix = var.domain
  }
}
