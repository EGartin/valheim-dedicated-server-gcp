/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 11
*/
 #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md

# Configure the Microsoft Azure Provider
provider "google" {
  project     = "seismic-mantis-313421"
  region      = "us-central1" #Oregon
  #zone       = "us-central1-c"
  credentials = file("./seismic-mantis-313421-cf022b7d80c1.json")
}