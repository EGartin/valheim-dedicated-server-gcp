/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/
# server
variable "instance_type"    {}
variable "zone"      {}
variable "disk-image-type"  {}
variable "disk-image-size"  {}
variable "service_account_email" {}
variable "vpc"  {}
variable "subnet_id"        {}
variable "user_data" {}