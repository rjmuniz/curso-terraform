provider "aws" {
  region = var.region
}


terraform {
  backend "s3" {
    bucket = "curso-aws-terraform-rjmuniz-remote-state-dev"
    key    = "ec2/ec2.tfstate"
    region = "us-east-1"
  }
}

locals {
  conn_type        = "ssh"
  conn_user        = "ec2-user"
  conn_timeout     = "1m"
  conn_private_key = "file(var.pem_path)"
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "terraform_keyPair"

  provisioner "file" {
    source      = "0000_testefile.txt"
    destination = "/tmp/filelog.txt"

    connection {
      type        = local.conn_type
      user        = local.conn_user
      host        = self.public_ip
      timeout     = local.conn_timeout
      private_key = local.conn_private_key
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 10",
      "sudo yum uypdate -y",
      "sudo yum install -y httpd",
      "sudo service httpd start",
      "sudo chkconfig httpd on",
      "sleep 10"
    ]

    connection {
      type        = local.conn_type
      user        = local.conn_user
      host        = self.public_ip
      timeout     = local.conn_timeout
      private_key = local.conn_private_key
    }
  }
}

resource "tls_private_key" "pkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = "rjmuniz-${var.env}"
  public_key = tls_private_key.pkey.public_key_openssh
}
resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.id}:${aws_instance.web.public_ip} >> public_ips.txt"
  }
}