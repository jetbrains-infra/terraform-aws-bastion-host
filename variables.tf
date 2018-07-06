variable "subnet_id" {}
variable "ssh_key" {}
variable "allowed_hosts" {
  description = "CIDR blocks of trusted networks"
  type        = "list"
  default     = ["0.0.0.0/0"]
}