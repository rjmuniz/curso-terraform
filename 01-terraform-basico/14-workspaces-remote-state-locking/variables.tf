variable "region" {
  default = "us-east-1"
}


variable "project_name" {
  default = "curso-aws-terraform"
}


variable "ami" {
  type = "map"
  
  default = {
    "dev" = "ami-0742b4e673072066f"
    "prod" = "xpto"
  }
}

variable "type" {
  default = {
    "dev" = "t2.micro"
    "prod" = "t2.medium"
  }
}
