/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 13
*/

output "public_ip"  {
    value = google_compute_instance.valheim-server.network_interface.0.access_config.0.nat_ip
}
