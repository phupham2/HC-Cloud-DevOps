# Defining security groups for subnet

resource "aws_security_group" "myrounding_sg_instance" {
	name = "myrounding_vpc_sg_public"
	description = "Allow incoming HTTP, HTTPS request and SSH"

#Allowing http request from internet 
ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
}

#Allowing https request from internet
ingress {
	from_port = 443
	to_port = 443
	protocol = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
}

#Allowing SSH request from internal network
ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["${var.vpc_cidr}"]
}

#Allowing mysql request to db instance
egress {
	from_port = 3306
	to_port = 3306
	protocol = "tcp"
	cidr_blocks = ["${var.private_subnet}"]
}
}