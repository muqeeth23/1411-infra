module "dev-vpc" {
  source   = "./modules/vpc-module"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "dev-vpc"
}

module "dev-sn-1" {
  source      = "./modules/subnet-module"
  vpc_id      = module.dev-vpc.vpcidop
  subnet_name = "dev-sn1"
  subnet_cidr = "10.0.0.0/24"
}

module "dev-sn-2" {
  source      = "./modules/subnet-module"
  vpc_id      = module.dev-vpc.vpcidop
  subnet_name = "dev-sn2"
  subnet_cidr = "10.0.1.0/24"
}

module "igw1" {
  source   = "./modules/igw-module"
  vpc_id   = module.dev-vpc.vpcidop
  igw_name = "dev-igw1"

}

module "rt1" {
  source                 = "./modules/routetable-module"
  vpc_id                 = module.dev-vpc.vpcidop
  rt_name                = "dev-rt1"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.igw1.igwidop
  vpc_cidr               = "10.0.0.0/16"
  subnet_id              = module.dev-sn-1.subnetidop

}

