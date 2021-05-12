/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 12
*/

locals {
    #env_type        = "PRODUCTION/TESTING/ETC"
    keyname         = file("./{YOURKEYNAME}.json")
    #You can use the "get-your-ip.sh" script and then end this variable in the vars.tf
    your_ip         = "YOUR_IP/32"
    region          = "us-central1"
    zone            = "us-central1-a"
    service_account_email = "{SERVICEACCOUNT}@{PROJECTNAME}.gserviceaccount.com"
}

/* BUILD NETWORK */
module "network" {
    source  = "./modules/network"
    region  = local.region
}

module "securitygroups" {
    source          = "./modules/security-groups"
    your_ip         = local.your_ip
    vpc             = module.network.vpc
}

/* BUILD SERVER */
module "server" {
    source                  = "./modules/dedicated-server"
    instance_type           = "f1-micro"
    zone                    = local.zone
    vpc                     = module.network.vpc
    subnet_id               = module.network.network_subnet_id
    service_account_email   = local.service_account_email
    disk-image-type         = "pd-standard"
    disk-image-size         = 30
    #keyname                = local.keyname
    user_data               = file("./scripts/bootstrap.sh")
}
