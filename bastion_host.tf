module "host" {
  source = "github.com/jetbrains-infra/terraform-aws-spot-fleet"
  subnet_id = "${var.subnet_id}"
  ssh_key = "${var.ssh_key}"
  security_group_ids = "${aws_security_group.to_bastion.id}"
  name = "BastionHost"
  public_ip = true
}