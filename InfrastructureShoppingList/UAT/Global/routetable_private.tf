#Defining route table 

resource "aws_route_table" "hap_private_rt" {
	vpc_id = "${aws_vpc.hap_vpc.id}"

 route {
	cidr_block = "0.0.0.0/0"
	nat_gateway_id = "${aws_nat_gateway.hap_nat.id}"
	 
}

 tags {
	Name = "Myrounding Private Subnet RT"
}
}

#Associate route table to private subnet

resource "aws_route_table_association" "hap_private_rt" {
	subnet_id = "${aws_subnet.hap_subnet_private.id}"
	route_table_id = "${aws_route_table.hap_private_rt.id}"
}
