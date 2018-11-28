#Definition of variables

variable "aws_region" {
	default = "us-east-1"
}

variable "access_key"{
	default = "AKIAJBPYP445CM6FWVFA"
}

variable "secret_key"{
	default = "dJsjscy5MxECQ6wnkt9IwURykSXtqlraJBBdhGSi"
}

#Variables for EC2 instances 
variable "instance_count" {
        default = "3"
}

variable "amis" {
	default = "ami-38708b45"
}

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


#Variables for DB instances
variable "storage" {
	default = 20
}
variable "engine" {
	default = "mysql"
}
variable "engine_version" {
	default = "5.7"
}
variable "instance_class" {
	default = "db.t2.micro"
}
variable "db_name" {
	default = "myrounding_app_db"
}
variable "username" {
	default = "srinath"
}
variable "password" {
	default = "srinath"
}

#Declare the data source for availabilty zones
data "aws_availability_zones" "myrounding_useast_az" {}



