data "aws_subnet" "public" {
  id = "${var.subnet_id}"
}

resource "aws_security_group" "bastion" {
  name = "Bastion"
  description = "Allow inbound SSH and outbound internet access"
  vpc_id = "${data.aws_subnet.public.vpc_id}"

  # SSH acces
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}