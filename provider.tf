/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 JUN 10
*/
 #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md

# Configure the Google Provider
provider "google" {
  project     = var.project
  region      = var.region
}
