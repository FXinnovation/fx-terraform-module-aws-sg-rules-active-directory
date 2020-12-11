#####
# Locals
#####

locals {
  dns_port                              = 53
  kerberos_key_distribution_center_port = 88
  ntp_port                              = 123
  remote_procedure_call_port            = 135
  net_bios_name_resolution_port         = 137
  net_bios_datagram_service_port        = 138
  net_bios_session_service_port         = 139
  ldap_port                             = 389
  smb_port                              = 445
  kerberos_password_v5_port             = 464
  ldaps_port                            = 636
  global_catalog_port                   = 3268
  high_tcp_from_port                    = 49152
  high_tcp_to_port                      = 65535
  create_cidr_rules                     = null == var.active_directory_cidrs ? 0 : 1
}

#####
# Security Group to CIDR's Rules
#####

resource "aws_security_group_rule" "out_tcp_dns_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - DNS (tcp)"
  type              = "egress"
  from_port         = local.dns_port
  to_port           = local.dns_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_udp_dns_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - DNS (udp)"
  type              = "egress"
  from_port         = local.dns_port
  to_port           = local.dns_port
  protocol          = "udp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_keyberos_key_distribution_center_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - Kerberos Key Distribution Center"
  type              = "egress"
  from_port         = local.kerberos_key_distribution_center_port
  to_port           = local.kerberos_key_distribution_center_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_udp_ntp_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - NTP"
  type              = "egress"
  from_port         = local.ntp_port
  to_port           = local.ntp_port
  protocol          = "udp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_remote_procedure_call_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - Remote Procedure Call"
  type              = "egress"
  from_port         = local.remote_procedure_call_port
  to_port           = local.remote_procedure_call_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_udp_net_bios_name_resolution_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - NetBIOS Name Resolution"
  type              = "egress"
  from_port         = local.net_bios_name_resolution_port
  to_port           = local.net_bios_name_resolution_port
  protocol          = "udp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_udp_net_bios_datagram_service_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - NetBIOS Datagram Service"
  type              = "egress"
  from_port         = local.net_bios_datagram_service_port
  to_port           = local.net_bios_datagram_service_port
  protocol          = "udp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_net_bios_session_service_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - NetBIOS Session Service"
  type              = "egress"
  from_port         = local.net_bios_session_service_port
  to_port           = local.net_bios_session_service_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_ldap_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - LDAP"
  type              = "egress"
  from_port         = local.ldap_port
  to_port           = local.ldap_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_udp_ldap_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - LDAP, DC Locator, Net Logon"
  type              = "egress"
  from_port         = local.ldap_port
  to_port           = local.ldap_port
  protocol          = "udp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_smb_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - SMB, Net Logon"
  type              = "egress"
  from_port         = local.smb_port
  to_port           = local.smb_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_kerberos_password_v5_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - Kerberos Password V5"
  type              = "egress"
  from_port         = local.kerberos_password_v5_port
  to_port           = local.kerberos_password_v5_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_ldaps_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - LDAP SSL (tcp)"
  type              = "egress"
  from_port         = local.ldaps_port
  to_port           = local.ldaps_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_udp_ldaps_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - LDAP SSL (udp)"
  type              = "egress"
  from_port         = local.ldaps_port
  to_port           = local.ldaps_port
  protocol          = "udp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_global_catalog_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - Global Catalog"
  type              = "egress"
  from_port         = local.global_catalog_port
  to_port           = local.global_catalog_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

resource "aws_security_group_rule" "out_tcp_high_tcp_cidrs" {
  count = local.create_cidr_rules

  description       = "Active Directory - Randomly allocated high TCP ports"
  type              = "egress"
  from_port         = local.high_tcp_from_port
  to_port           = local.high_tcp_to_port
  protocol          = "tcp"
  cidr_blocks       = var.active_directory_cidrs
  security_group_id = var.security_group_id
}

#####
# Security Group to Security Group Rules
#####

resource "aws_security_group_rule" "out_tcp_dns_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - DNS"
  type                     = "egress"
  from_port                = local.dns_port
  to_port                  = local.dns_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_udp_dns_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - DNS"
  type                     = "egress"
  from_port                = local.dns_port
  to_port                  = local.dns_port
  protocol                 = "udp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_keyberos_key_distribution_center_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - Kerberos Key Distribution Center"
  type                     = "egress"
  from_port                = local.kerberos_key_distribution_center_port
  to_port                  = local.kerberos_key_distribution_center_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_udp_ntp_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - NTP"
  type                     = "egress"
  from_port                = local.ntp_port
  to_port                  = local.ntp_port
  protocol                 = "udp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_remote_procedure_call_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - Remote Procedure Call"
  type                     = "egress"
  from_port                = local.remote_procedure_call_port
  to_port                  = local.remote_procedure_call_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_udp_net_bios_name_resolution_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - NetBIOS Name Resolution"
  type                     = "egress"
  from_port                = local.net_bios_name_resolution_port
  to_port                  = local.net_bios_name_resolution_port
  protocol                 = "udp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_udp_net_bios_datagram_service_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - NetBIOS Datagram Service"
  type                     = "egress"
  from_port                = local.net_bios_datagram_service_port
  to_port                  = local.net_bios_datagram_service_port
  protocol                 = "udp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_net_bios_session_service_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - NetBIOS Session Service"
  type                     = "egress"
  from_port                = local.net_bios_session_service_port
  to_port                  = local.net_bios_session_service_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_ldap_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - LDAP"
  type                     = "egress"
  from_port                = local.ldap_port
  to_port                  = local.ldap_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_udp_ldap_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - LDAP, DC Locator, Net Logon"
  type                     = "egress"
  from_port                = local.ldap_port
  to_port                  = local.ldap_port
  protocol                 = "udp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_smb_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - SMB, Net Logon"
  type                     = "egress"
  from_port                = local.smb_port
  to_port                  = local.smb_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_kerberos_password_v5_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - Kerberos Password V5"
  type                     = "egress"
  from_port                = local.kerberos_password_v5_port
  to_port                  = local.kerberos_password_v5_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_ldaps_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - LDAP SSL"
  type                     = "egress"
  from_port                = local.ldaps_port
  to_port                  = local.ldaps_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_udp_ldaps_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - LDAP SSL"
  type                     = "egress"
  from_port                = local.ldaps_port
  to_port                  = local.ldaps_port
  protocol                 = "udp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_global_catalog_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - Global Catalog"
  type                     = "egress"
  from_port                = local.global_catalog_port
  to_port                  = local.global_catalog_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}

resource "aws_security_group_rule" "out_tcp_high_tcp_security_groups" {
  count = var.active_directory_security_group_ids_count

  description              = "Active Directory - Randomly allocated high TCP ports"
  type                     = "egress"
  from_port                = local.high_tcp_from_port
  to_port                  = local.high_tcp_to_port
  protocol                 = "tcp"
  security_group_id        = var.security_group_id
  source_security_group_id = var.active_directory_security_group_ids[count.index]
}
