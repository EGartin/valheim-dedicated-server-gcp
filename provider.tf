/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 13
*/
 #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md

# Configure the Google Provider
provider "google" {
  project     = var.project
  region      = var.region
  credentials = file("./seismic-mantis-313421-cf022b7d80c1.json")
}