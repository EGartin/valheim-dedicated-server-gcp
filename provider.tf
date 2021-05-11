/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 11
*/
 #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md

# Configure the Microsoft Azure Provider
provider "google" {
  project     = "valheim-dedicated-server"
  #Oregon
  region      = "us-central1"
  #zone        = "us-central1-c"

}