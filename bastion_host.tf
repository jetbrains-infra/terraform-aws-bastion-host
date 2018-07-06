data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "product-code"
    values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }

  owners = ["aws-marketplace"]
}

resource "aws_instance" "server" {
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.ssh_key}"
  subnet_id                   = "${var.subnet_id}"
  vpc_security_group_ids      = ["${aws_security_group.bastion.id}"]
  associate_public_ip_address = true

  root_block_device {
    volume_size           = "${var.disk_size}"
    delete_on_termination = true
  }

  tags {
    Name = "Bastion host"
  }
}