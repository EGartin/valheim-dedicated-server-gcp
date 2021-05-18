/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 01
*/


output "public" {
    value = module.server.public_ip
}
output "my-email" {
  value = data.google_client_openid_userinfo.me.email
}
/*
output "public" {
    value = module.spotserver.public_ip
}
*/