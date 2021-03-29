variable "region" {
    default = "us-east-1"
    description = "Main region"  
}

variable "ami" {
  default = "ami-0533f2ba8a1995cf9"
}

variable "env" {
  default = "dev"
}

variable "instance_type" {
  default = "t2.micro"  
}
