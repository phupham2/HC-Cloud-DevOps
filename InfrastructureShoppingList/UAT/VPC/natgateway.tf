resource "aws_eip" "${var.cluster_name}_eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.hap_gw"]
}

resource "aws_nat_gateway" "${var.cluster_name}_nat" {
    allocation_id = "${aws_eip.hap_eip.id}"
    subnet_id = "${aws_subnet.hap_subnet_public.id}"
    depends_on = ["aws_internet_gateway.hap_gw"]
}