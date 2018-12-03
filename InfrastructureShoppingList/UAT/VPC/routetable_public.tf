#Defining route table for public subnet

resource "aws_route_table" "hap_public_rt" {
	vpc_id = "${aws_vpc.hap_vpc.id}"

 route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.hap_gw.id}"
 
}

 tags {
	Name = "Myrounding Public Subnet RT"
}
}

#Associate route table to public subnet

resource "aws_route_table_association" "hap_public_rt" {
	subnet_id = "${aws_subnet.hap_subnet_public.id}"
	route_table_id = "${aws_route_table.hap_public_rt.id}"
}
