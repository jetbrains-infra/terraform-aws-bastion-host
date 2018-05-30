data "aws_subnet" "public" {
  id = "${var.subnet_id}"
}
resource "aws_security_group" "from_bastion" {
  name = "Access for bastion host"
  description = "Allow SSH access from bastion host"
  vpc_id = "${data.aws_subnet.public.vpc_id}"

  # SSH acces
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.to_bastion.id}"]
  }
}
resource "aws_security_group" "to_bastion" {
  name = "Access to bastion host"
  description = "Allow SSH access to bastion host and outbound internet access"
  vpc_id = "${data.aws_subnet.public.vpc_id}"

  # SSH acces
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${split(",", var.allowed_hosts)}"]
  }

  # outbound internet access
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}