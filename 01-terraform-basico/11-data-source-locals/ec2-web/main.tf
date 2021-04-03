provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    #bucket = "curso-aws-terraform-rjmuniz-remote-state-dev"
    #key    = "ec2/ec2.tfstate"
    #region = "us-east-1"
  }
}

data "aws_ami" "custom" {
  owners=["amazon"]
  most_recent = true
  name_regex = "([U|u]buntu)"
  
}
resource "aws_instance" "web" {
  ami           = data.aws_ami.custom.id
  instance_type = var.instance_type
}


/*
passando as configurações do remote state via cli
terraform init \
  -backend=true \
  -backend-config="region=us-east-1" \
  -backend-config="bucket=curso-aws-terraform-rjmuniz-remote-state-dev" \
  -backend-config="key=ec2/ec2.tfstate"


$ terraform output id
$ terraform output ami
$ terraform output arn
*/