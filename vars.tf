/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 JUN 10
*/

variable "your_ip" {
    default = "{YOUR_IP_HERE}/32"
}

variable "region"  {
    default = "us-central1" #IOWA
}   

variable "zone" {
    default = "us-central1-a" #IOWA A
}   

variable "service_account_email" {
    default = "{YOUR_SERVICE_ACCOUNT_NAME}@{YOUR-PROJECT}.iam.gserviceaccount.com"
}

variable "project"  {
    default = "{YOUR-PROJECT}"
}
    