provider "aws" {
    profile = var.profile
    region = var.region
}


resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.type_instance

    # ipv6_addresses = var.ips
    tags = var.tags
}   


/* 
Variáveis opcionais:
 - terraform plan -var 'type_instance=t2.micro'
ou
 - terraform plan    -var-file "dev.tfvars"
 - terraform plan    -var-file "prod.tfvars"
 - terraform plan    -var-file "prod.tfvars" -var "ami=123412431234214"
 - terraform apply   -var-file "dev.tfvars"
 - terraform destroy -var-file "dev.tfvars"
*/
