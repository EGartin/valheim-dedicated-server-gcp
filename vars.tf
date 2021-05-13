/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 13
*/

variable "your_ip" {
    default = "YOURIP/32"
}

variable "region"  {
    default = "us-central1" #IOWA
}   

variable "zone" {
    default = "us-central1-a" #IOWA A
}   

variable "service_account_email" {
    default = "{SERVICE_ACCOUNT}@{PROJECT_NAME}.iam.gserviceaccount.com"
}

variable "project"  {
    default = "{PROJECT_NAME}"
}
    