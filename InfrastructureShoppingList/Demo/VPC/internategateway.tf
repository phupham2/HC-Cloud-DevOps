#Defining internet gateway for public subnet

resource "aws_internet_gateway" "hap_gw" {
	vpc_id = "${aws_vpc.hap_vpc.id}"

tags {
	Name = "HAP VPC IGW"
}
}