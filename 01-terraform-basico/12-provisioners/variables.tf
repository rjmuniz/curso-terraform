variable "region" {
  default = "us-east-1"
}

variable "pem_path" {
  default = "terraform_keyPair.pem"
}
variable "ami" {
  default = "ami-0742b4e673072066f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "env" {
  default = "dev"
}