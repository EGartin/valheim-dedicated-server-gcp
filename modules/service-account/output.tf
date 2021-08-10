/*
* PROJECT: Valheim Dedicated Server
* FILE: Service Account :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 AUG 09
*/

output "service_account_email" {
    value = google_service_account.sa.email
}