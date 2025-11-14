resource "aws_subnet" "sn1" {
    cidr_block = var.subnet_cidr
    vpc_id     = var.vpc_id
    tags = {
        Name = var.subnet_name
    }
  
}