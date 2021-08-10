/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 13
*/

/* CREATE SERVICE ACCOUNTS*/
module "serviceaccount"{
    source = "./modules/service-account"
    account_id = var.account_id
    display_name = var.display_name
}

/* BUILD NETWORK */
module "network" {
    source  = "./modules/network"
    region  = var.region
}

module "securitygroups" {
    source          = "./modules/security-groups"
    your_ip         = var.your_ip
    vpc             = module.network.vpc
}

/* BUILD SERVER */
module "server" {
    source                  = "./modules/dedicated-server"
    instance_type           = "e2-standard-2" #f1-micro for testing
    zone                    = var.zone
    vpc                     = module.network.vpc
    subnet_id               = module.network.network_subnet_id
    service_account_email   = module.serviceaccount.service_account_email
    disk-image-type         = "pd-standard"
    disk-image-size         = 30
    user_data               = file("./scripts/bootstrap.sh")
}
