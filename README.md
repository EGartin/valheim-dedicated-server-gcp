# Valheim Dedicated Server Google Cloud Platform IaaS Build

## Terraform

### 2021 MAY 11

## Disclaimer/Legal

All use of these tools are the sole responsibility of the user applying the build in their own Cloud Environments.  Elijah Gartin/Falkon, Thunder Rock Gaming, ZeroBandwidth/And All Aliases, and any affiliated associates assume no liability for any issues or costs associated with utilizing these tools. You accept these terms and assume all responsibility by using and deploying any asset or artifact in this repository.

## About

This repository is to build a Valheim Dedicated Server from Google Cloud Platform.  We assume you know how to use Google Cloud Platform.

Pulling from Ubuntu Server immutable images and a dynamic Valheim Build library created by ZeroBandwidth and associates. [Application Build Github](https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git). 

I do have some ambitions to try and create something like this for all the major cloud providers. All critiques are welcome via the Github Issue tracker or through discord.

## Prerequisites

  - [Google Cloud Platform Account](https://cloud.google.com/compute/)
    - For Each Project?
      - [Enable Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com)
      - [Enable IAM Service Account Credentials API](https://console.cloud.google.com/apis/library/iamcredentials.googleapis.com)
  - [Terraform](https://www.terraform.io/downloads.html) (Tested on version 0.14.5)

## Steps

You'll be editing some lines in the `ROOT:main.tf` file for the local variables between line 8 and 13. Steps described below. Mileage may vary depending on what data center you try to push to.

You'll notice some of the taxonomy in referring to files such as `ROOT:filename`.  Root will be the root of the folder structure. Any modules will change the name of `ROOT` to `NETWORK` for example where there is another grouping of similarily named files.  This is a Terraform thing that some people may not be familiar with.

1. `ROOT:main.tf`: Use `curl https://ipinfo.io/ip` to obtain your IP and input it in the locals variable for `your_ip` in the this file. This is essential for you to be able to SSH from your box.  If you intend to use a bastion host, make sure you're putting in the ip for the bastion host.

2. `ROOT:provider.tf` Edit file to input your unique identifiers if you're going to use service accounts for impersonation. 
    - [GCP Terraform Docs](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference)
    - [GCP SDK Quickstart](https://cloud.google.com/sdk/docs/quickstart#deb)

3. `ROOT:provider.tf`: Change location to data center you want. Keep in mind costs differ between data centers. 
    - [Google Datacenters](https://cloud.google.com/about/locations/)

4. `ROOT: main.tf`: Make sure the keypair you created in IAM is properly referred to in in the locals on line 10.

5. Once you've saved all your changes, open a terminal/command prompt to the location of this repository and run the following commands in succession:
    - `terraform init`
    - `terraform apply`

  You can destroy all assets when you are completed using `terraform destroy`

  **WARNING**
  Make sure you backup your game if you've made progress and want to keep it. If it becomes additionally requested I may add more functionality to play with the backup functionality that ZeroBandwidth and crew have developed.

  Alternatively you can just backup with their scripts and then use SCP to download the backup.

  Example:
  ```scp -i KEYNAME ubuntu@IPADDRESS:/home/steam/backups/valheim-backup-DATEUUID.tgz ~/Downloads/valheim-backup-DATEUUID.tgz```

  You can then reupload this to Data Blobs and have it download from the `/scripts/bootstrap.sh` script if you care to if you have to rebuild a server.

## Network Schema

10.10.10.0/24 - Main Subnet (Server will build here as 10.10.10.69 (Nice))

The server will currently build as a `e2-standard-2` (2vCPU 8GB RAM). Depending on the size of the world and how many users, you may need to adjust the size. With Terraform, it should be as simple as updating the line of code in `ROOT:main.tf` line 41 with the new sizing and re-running `terraform apply`. Make sure you stop the server and backup before doing it, just in case.

f1-micro - for testing

## Support for Infrastructure as Code

Author: Elijah Gartin (Falkon)

- [Website](https://www.thunderrockgaming.com)
- [Discord](https://discord.gg/Trwr3Ty)
- [Falkon Twitch](https://twitch.tv/FalkonTTV)

## Support for Valheim Server Scripts

Author: ZeroBandwith (And Many More)

- [ZeroBandwith Discord](https://discord.gg/ejgQUfc)
- [ZeroBandwith Github Repo](https://github.com/Nimdy/Dedicated_Valheim_Server_Script.git)