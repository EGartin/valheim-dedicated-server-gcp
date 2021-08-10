/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 AUG 09
*/

variable "your_ip" {
    default = "{{ YOUR_IP }}/32"
}

variable "region"  {
    default = "us-central1" #IOWA
}   

variable "zone" {
    default = "us-central1-a" #IOWA A
}   

variable "account_id" {
    default = "valheim-sa-id"
}
variable "display_name" {
    default = "valheim-service-account"
}

variable "project"  {
    default = "{{ YOUR PROJECT ID }}"
}
    
