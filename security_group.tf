data "aws_subnet" "public" {
  id = "${var.subnet_id}"
}

resource "aws_security_group" "bastion" {
  name        = "Bastion"
  description = "Allow SSH access to bastion host and outbound internet access"
  vpc_id      = "${data.aws_subnet.public.vpc_id}"
}

resource "aws_security_group_rule" "ssh" {
  protocol          = "TCP"
  from_port         = 22
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["${var.allowed_hosts}"]
  security_group_id = "${aws_security_group.bastion.id}"
}

resource "aws_security_group_rule" "internet" {
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.bastion.id}"
}