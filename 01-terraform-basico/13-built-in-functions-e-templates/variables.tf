variable "env" {
  default = "dev"
}

variable "region" {
  type = map(string)

  default = {
    "dev"  = "us-east-1"
    "prod" = "sa-east-1"
  }
}