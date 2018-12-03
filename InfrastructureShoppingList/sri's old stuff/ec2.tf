#Defining Cloud Provider to orchestrate environment

provider "aws" {
	region = "${var.aws_region}"
	#region     = "us-east-1
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
}

#Creating a new key pair while launching the instance
#1. Generate Public and Private Key using ssh-keygen and save into a file

#resource "aws_key_pair" "myrounding_ssh" {
#	key_name = "myrounding_ssh"
#	public_key = "${file("myrounding-key")}"
#}

#Amazon EC2 instance Launch

resource "aws_instance" "myrounding_instance" {
	count = "${var.instance_count}"
	ami = "${lookup(var.amis,var.region)}"
	instance_type = "t2.micro"
#	key_name = "${aws_key_pair.myrounding_ssh.key_name}"
	key_name = "amit"
	subnet_id = "${aws_subnet.myrounding_subnet_public.id}"
	vpc_security_group_ids = ["${aws_security_group.myrounding_sg_instance.id}"]
	tags {
	Name = "Myrounding_Instance-$(count.index + 1)"
}
root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = false
  }

}

#ebs_block_device = 
#    {
#      device_name           = "/dev/xvdz"
#      volume_type           = "gp2"
#      volume_size           = "50"
#      delete_on_termination = true
#    },
