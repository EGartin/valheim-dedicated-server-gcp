/*
* PROJECT: Valheim Dedicated Server
* FILE: Service Account :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 AUG 09
*/

data "google_compute_default_service_account" "default" {
}

data "google_client_openid_userinfo" "me" {
}

resource "google_service_account" "sa" {
  account_id   = var.account_id
  display_name = var.display_name
}

resource "google_service_account_iam_member" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  role               = "roles/iam.serviceAccountUser"
  member             = "email:${data.google_client_openid_userinfo.me.email}"
}

# Allow SA service account use the default GCE account
resource "google_service_account_iam_member" "gce-default-account-iam" {
  service_account_id = data.google_compute_default_service_account.default.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.sa.email}"
}

resource "google_os_login_ssh_public_key" "self" {
  user =  data.google_client_openid_userinfo.me.email
  key = file("~/.ssh/google_compute_engine.pub")
}