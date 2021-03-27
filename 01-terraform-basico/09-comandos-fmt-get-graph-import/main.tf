provider "aws" {
  region = var.region
}

resource "random_id" "bucket" {
  byte_length = 8
}
resource "random_id" "bucket_2" {
  byte_length = 4
}


module "bucket" {
  source = "./s3"

  name = "my-bucket-tf-${random_id.bucket.hex}"

  versioning = true
  tags = {
    "Name" = "Meu bucket de anotações"
  }
  create_object = true
  object_key    = "files/${random_id.bucket.dec}.txt"
  object_source = "file.txt"
}


module "bucket-2" {
  source = "./s3"

  name = "my-bucket-tf-${random_id.bucket_2.hex}"
}


/*
# FMT formata os arquivos do terraform
$ terraform fmt -recursive

# GET baixa as dependencias
$ terraform get

# IMPORT puxa informações da aws e adiciona no state do terraform
$ terraform import aws_s3_bucket.meu_bucket my-aws-bucket-name-rjmuniz
  - 1. ele retorna um erro com um trecho de código
  - 2. pega e cole no arquivo tf
  - 3. preencha as informações do bucket no arquivo tf
  - 4. rode o comando de novo

# GRAPH, permite exportar para um arquivo - diagrama
$ terraform graph 
*/