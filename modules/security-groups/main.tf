/*
* PROJECT: Valheim Dedicated Server
* FILE: SECURITY-GROUPS :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 05
*/

resource "azurerm_network_security_group" "ssh" {
  name                = "SSH"
  location            = var.azurerm_resource_location
  resource_group_name = var.azurerm_resource_group

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.your_ip
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "valheim_external_ports" {
  name                = "Valheim_Ports"
  location            = var.azurerm_resource_location
  resource_group_name = var.azurerm_resource_group
  
  #TCP
  security_rule {
    name                       = "ValheimTCP0"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "2456-2458"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimTCP1"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "27015-27030"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimTCP2"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "27036-27037"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  #UDP
  security_rule {
    name                       = "ValheimUDP0"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "UDP"
    source_port_range          = "*"
    destination_port_range     = "2456-2458"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimUDP1"
    priority                   = 104
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "UDP"
    source_port_range          = "*"
    destination_port_range     = "4380"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimUDP2"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "UDP"
    source_port_range          = "*"
    destination_port_range     = "27000-27031"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ValheimUDP3"
    priority                   = 106
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "UDP"
    source_port_range          = "*"
    destination_port_range     = "27036"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }  
}

/*
## SSH
resource "aws_security_group" "ssh" {
    name        = "Secure Shell"
    description = "SSH Communication"
    vpc_id = var.vpc_id

    ingress{
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = var.your_ip
    }

    egress{
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    tags = {
        Name = "TF_SSH"
    }
}
*/