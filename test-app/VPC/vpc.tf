#Defining VPC to launch instance 
resource "aws_vpc" "myrounding_vpc" {
	cidr_block = "${var.vpc_cidr}"
	instance_tenancy = "default"
tags {
	Name = "Myrounding Vpc"
	Location = "Denver"
}
}

#Public Subnet for Myrounding VPC
resource "aws_subnet" "myrounding_subnet_public" {
	cidr_block = "${var.public_subnet}"
	vpc_id = "${aws_vpc.myrounding_vpc.id}"
	availability_zone = "${data.aws_availability_zones.myrounding_useast_az.names[0]}"

	#availability_zone = "${element(data.aws_availability_zones.myrounding_useast_az.names)}"

tags {
	Name = "Myrounding Public Subnet"
}
}

#Private Subnet for Myrounding VPC
resource "aws_subnet" "myrounding_subnet_private" {
	cidr_block = "${var.private_subnet}"
	vpc_id = "${aws_vpc.myrounding_vpc.id}"
	availability_zone = "${data.aws_availability_zones.myrounding_useast_az.names[1]}"

tags {
	Name = "Myrounding Private Subnet"
}
}