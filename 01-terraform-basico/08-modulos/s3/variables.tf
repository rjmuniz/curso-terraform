variable "name" {
  
}

variable "acl" {
  default = "private"
}

variable "versioning" {
  default = false
}
variable "tags" {
  type = map
  default = {}
}


variable "create_object" {
  default = false
}

variable "object_source" {
  default = ""
}
variable "object_key" {
  default = ""
}
