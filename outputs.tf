output "security_group" {
  value = "${aws_security_group.from_bastion.id}"
}