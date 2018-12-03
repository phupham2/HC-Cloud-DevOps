#Variable for VPC and Subnets
variable "vpc_cidr" {
	default = "192.168.0.0/16"
}
variable "public_subnet" {
	default = "192.168.1.0/24"
}
variable "private_subnet" {
	default = "192.168.2.0/24"
}
#Declare the data source for availabilty zones
data "aws_availability_zones" "hap_useast_az" {}
