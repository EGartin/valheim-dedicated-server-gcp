/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 13
*/
locals {
  uuid = uuid()
  uuid_prefix = element(split("-", local.uuid), 0)
  uuid_four = substr(local.uuid_prefix,0,4)
}

data "google_compute_image" "ubuntu" {
  family  = "ubuntu-1804-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_instance" "valheim-server" {
  name         = "valheim-server"
  machine_type = var.instance_type
  allow_stopping_for_update = true
  zone         = var.zone
  metadata_startup_script = var.user_data
  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
      type  = var.disk-image-type
      size  = var.disk-image-size
    }
  }

  network_interface {
    network = var.vpc
    subnetwork = var.subnet_id

    access_config {
    }
  }

  service_account {
    email = var.service_account_email
    scopes = ["cloud-platform"]
  }

}