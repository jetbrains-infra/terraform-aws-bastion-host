variable "subnet_id" {}
variable "ssh_key" {}
variable "allowed_hosts" {
  description = "CIDR blocks of trusted networks"
  type        = "list"
  default     = ["0.0.0.0/0"]
}

variable "instance_type" {
  description = "The type of instance to start."
  default     = "t2.micro"
}

variable "disk_size" {
  description = "The size of the root volume in gigabytes."
  default = 10
}

variable "internal_networks" {
  description = "Internal network CIDR blocks."
}