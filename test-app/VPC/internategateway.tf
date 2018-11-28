#Defining internet gateway for public subnet

resource "aws_internet_gateway" "myroundig_gw" {
	vpc_id = "${aws_vpc.myrounding_vpc.id}"

tags {
	Name = "Myrounding VPC IGW"
}
}