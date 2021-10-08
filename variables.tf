variable "name" {
  description = "The specification of module name."
  type        = string
  default     = "terraform_name"
}

variable "description" {
  description = "The Function Compute Service description."
  type        = string
  default     = "tf unit test"
}

variable "internet_access" {
  description = "The specification of internet access."
  type        = bool
  default     = true
}

variable "role" {
  description = "RAM role arn attached to the Function Compute Service."
  type        = string
  default     = ""
}

variable "security_group_id" {
  description = "A security group ID associated with the Function Compute Service."
  type        = string
  default     = ""
}

variable "vswitch_ids" {
  description = "A list of vswitch IDs associated with the Function Compute Service."
  type        = list(string)
  default     = []
}

variable "group_id" {
  description = "The group id of your NAS file system."
  type        = number
  default     = -1
}

variable "user_id" {
  description = "The user id of your NAS file system."
  type        = number
  default     = -1
}

variable "mount_dir" {
  description = "The local address where to mount your remote NAS directory."
  type        = string
  default     = "/home/www"
}

variable "server_addr" {
  description = "The address of the remote NAS directory."
  type        = string
  default     = ""
}

variable "role_name" {
  description = "Name of the RAM Role."
  type        = string
  default     = ""
}

variable "policy_name" {
  description = "Name of the RAM policy."
  type        = string
  default     = ""
}

variable "policy_type" {
  description = "Type of the RAM policy."
  type        = string
  default     = ""
}
