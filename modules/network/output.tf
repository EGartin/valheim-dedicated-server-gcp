/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 12
*/

#NETWORK DETAILS
output "vpc"    {
    value = google_compute_network.valheim-vpc.id
}

output "network_subnet_id"{
    value = google_compute_subnetwork.subnet.id
}


