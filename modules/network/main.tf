/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 11
*/

#RANGE 10.10.x.x VNET NETWORK
resource "google_compute_network" "valheim-vpc" {
  name                    = "valheim-vnet"
  description             = "valheim-vpc"
  auto_create_subnetworks = false
  #address_space       = ["10.10.0.0/16"]
}

#10 Subnet
resource "google_compute_subnetwork" "subnet" {
  name                    = "valheim-subnet"
  ip_cidr_range           = "10.10.10.0/24"
  region                  = var.region
  network                 = google_compute_network.valheim-vpc.id
}
