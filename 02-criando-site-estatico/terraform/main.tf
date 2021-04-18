provider "aws" {
  region = var.region
}

data "template_file" "policy" {
    template = file("templates/policy.json")

    # variavel a ser substituída na policy
    vars = {
      bucket_name = var.domain
    }
    
}