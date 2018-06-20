## About

Creates bastion host with allowed SSH access from specific IPs.

Features:
* Allow access from specific CIDRs (default is `0.0.0.0/0`)

## Outputs
* `security_group` - security group ID to allow access from bastion host to other nodes.

## Usage

```
module "bastion" {
  source        = "github.com/jetbrains-infra/terraform-aws-bastion-host"  
  subnet_id     = "${aws_subnet.public.id}"
  allowed_hosts = "11.22.33.44/32,99.88.77.66./24" // comma-separated list CIDRs
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  security_groups = ["${module.bastion.security_group}"]
}
``` 

