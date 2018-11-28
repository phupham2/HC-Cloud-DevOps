# Defining security groups for private subnet

resource "aws_security_group" "myrounding_sg_db" {
	
ingress {
	from_port = 3306
	to_port = 3306
	protocol = "tcp"
	cidr_blocks = ["${var.public_subnet}"]
	security_group 	= "${aws_security_group.myrounding_sg_instance.id}"	
	}

ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["${var.vpc_cidr}"]
}

egress {
	from_port = 3306
	to_port = 3306
	protocol = "tcp"
	cidr_blocks = ["${var.public_subnet}"]
	}

}


