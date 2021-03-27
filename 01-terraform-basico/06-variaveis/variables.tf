variable "profile" {
  default="default"
  description = "Profile AWS at ~/.aws/credentials"
}

variable "region" {
    default = "us-east-1"
    description = "Main region"  
}

variable "ami" {
  default = "ami-0533f2ba8a1995cf9"
}

variable "type_instance" {
  
}
variable "ips" {
    type = list
    default = [
        "2804:431:cfea:17e2:8cc6:4433:4ccd:8f6e", 
        "fe80::f7c4:385d:fbdb:7a93"]
}

variable "tags" {
    type = map
    default = {
        "Name": "Node.js"
        "Environment"="dev"
    }

  
}