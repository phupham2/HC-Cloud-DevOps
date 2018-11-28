#Defining route table for public subnet

resource "aws_route_table" "myrounding_public_rt" {
	vpc_id = "${aws_vpc.myrounding_vpc.id}"

 route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.myroundig_gw.id}"
 
}

 tags {
	Name = "Myrounding Public Subnet RT"
}
}

#Associate route table to public subnet

resource "aws_route_table_association" "myrounding_public_rt" {
	subnet_id = "${aws_subnet.myrounding_subnet_public.id}"
	route_table_id = "${aws_route_table.myrounding_public_rt.id}"
}
