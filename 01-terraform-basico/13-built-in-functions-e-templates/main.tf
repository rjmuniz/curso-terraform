provider "aws" {
  region = lookup(var.region, var.env)
}

locals {
  common_tags = {}

  file_ext    = "zip"
  object_name = "my-data"
}

resource "random_id" "bucket" {
  byte_length = 8
}

data "template_file" "json" {
    template = file("file-template.json")

    vars = {
        age = 39
        eye = "Black"
        name = "Ricardo Muniz"
        gender ="Male"
    }
}

data "archive_file" "json" {

}

module "bucket" {
  source = "../08-modulos/s3"

  name = "my-bucket-${random_ip.bucket.hex}"
  tags = merge(local.common_tags, map("name", "Meu bucket"), map("env", format("%s", var.env)))

  create_object = true
  object_key    = "${random_id.bucket.hex}.${local.file_ext}"
  object_source = data.archive_file.json.output_path
}