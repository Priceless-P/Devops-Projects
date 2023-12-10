module "vpc" {
  source = "./modules/vpc"
}

module "product_security_groups" {
    source = "./modules/security_groups/product_service_security_group"
    vpc_id =  module.vpc.vpc_id
}
module "user_service_security_group" {
    source = "./modules/security_groups/user_service_security_group"
    vpc_id =  module.vpc.vpc_id
}

module "compute" {
  source = "./modules/compute"
  security_groups_user = [ module.user_service_security_group.user_service_security_group_id ]
  security_groups_product = [module.product_security_groups.product_service_security_group_id]
  user_subnet_id = module.vpc.user_subnet_id
  product_subnet_id = module.vpc.product_subnet_id
}

module "user_service_mysql_db" {
    source = "./modules/databases/mysql"
    user_service_security_group_db = [module.user_service_security_group.user_service_security_group_db_id]
    db_subnet_group = module.vpc.product_subnet_group
}

module "product_service_postgress_db" {
    source = "./modules/databases/postgres"
    db_subnet_group =  module.vpc.product_subnet_group
    product_service_security_group = [module.product_security_groups.product_service_security_group_db_id]
}