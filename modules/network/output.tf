/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/

#NETWORK DETAILS
output "network_subnet_id"{
    value = google_compute_subnetwork.subnet.id
}


