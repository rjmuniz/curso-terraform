provider "aws" {
  region = var.region
}

data "terraform_remote_state" "web" {
  backend = "s3"
  config = {
    bucket = "curso-aws-terraform-rjmuniz-remote-state-dev"
    key    = "ec2/ec2.tfstate"
    region = var.region
  }
}
locals {
  instance_id = data.terraform_remote_state.web.outputs.id
  ami         = data.terraform_remote_state.web.outputs.ami
  arn         = data.terraform_remote_state.web.outputs.arn
}
resource "random_id" "bucket_rnd" {
  byte_length = 4
}

module "bucket" {
  source = "../../08-modulos/s3"

  name = "my-bucket-rjmuniz-${random_id.bucket_rnd.hex}"

  tags = {
    "Name" = "Minhas instâncias"
  }

  create_object = true
  object_key    = "instances/instances-${local.ami}.txt"
  object_source = "output.txt"
}