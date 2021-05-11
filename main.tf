/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/

locals {
    #env_type        = "PRODUCTION/TESTING/ETC"
    keyname         = file("./seismic-mantis-313421-cf022b7d80c1.json")
    #You can use the "get-your-ip.sh" script and then end this variable in the vars.tf
    your_ip         = "YOUR-IP/32"
}

/* BUILD NETWORK */
module "network" {
    source                      = "./modules/network"
}

module "securitygroups" {
    source          = "./modules/security-groups"
    your_ip         = local.your_ip
}

/* BUILD SERVER */
module "server" {
    source                  = "./modules/dedicated-server"
    instance_type           = "f1-micro"
    #subnet_id               = module.network.network_subnet_id
    #security_groups         = module.securitygroups.valheim_security_groups
    keyname                 = local.keyname
    user_data               = base64encode(file("./scripts/bootstrap.sh"))
}
