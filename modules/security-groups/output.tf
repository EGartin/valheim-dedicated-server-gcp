/*
* PROJECT: Valheim Dedicated Server
* FILE: SECURITY-GROUPS :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 12
*/

output "valheim_security_groups"    {
    value = [google_compute_firewall.valheim_external_ports.id, google_compute_firewall.ssh.id]
}
