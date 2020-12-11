variable "active_directory_cidrs" {
  description = "List of CIDR's of the active directory servers."
  type        = list(string)
  default     = []
}

variable "active_directory_security_group_ids" {
  description = "List of Security Group ID's of the active directory servers."
  type        = list(string)
  default     = []
}

variable "active_directory_security_group_ids_count" {
  description = "Number of Security Group ID's of the active directory servers."
  type        = number
  default     = 0
}

variable "security_group_id" {
  description = "ID of the security group to which to apply the rules on."
  type        = string
}
