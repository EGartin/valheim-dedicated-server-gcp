/*
* PROJECT: Valheim Dedicated Server
* FILE: SECURITY-GROUPS :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 12
*/
resource "google_compute_firewall" "ssh" {
  name    = "ssh"
  network = var.vpc
  source_ranges = [var.your_ip]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "valheim_external_ports" {
  name    = "valheim-external-ports"
  network = var.vpc

  allow {
    protocol  = "tcp"
    ports     = ["2456-2458", "27015-27030", "27036-27037"]
  }

  allow {
    protocol  = "udp"
    ports     = ["2456-2458", "4380", "27000-27031", "27036"]
  }
}