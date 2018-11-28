#Defining route table 

resource "aws_route_table" "myrounding_private_rt" {
	vpc_id = "${aws_vpc.myrounding_vpc.id}"

 route {
	cidr_block = "${var.vpc_cidr}"
	 
}

 tags {
	Name = "Myrounding Private Subnet RT"
}
}

#Associate route table to public subnet

resource "aws_route_table_association" "myrounding_private_rt" {
	subnet_id = "${aws_subnet.myrounding_subnet_private.id}"
	route_table_id = "${aws_route_table.myrounding_private_rt.id}"
}
