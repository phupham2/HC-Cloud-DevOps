#allow internet traffic
resource "aws_security_group" "sg_public" {
	name = "sg_public"
	description = "Allow incoming HTTP, HTTPS request and SSH"

    #Allowing http request from internet 
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #Allowing https request from internet
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #Allowing SSH request from internal network
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    #Allowing mysql request to db instance
    egress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["${var.private_subnet}"]
    }
}

resource "aws_security_group" "studer_sg" {
    name = "studer_sg"
    #Allowing http request from internet 
    ingress {
	    from_port = 80
	    to_port = 80
	    protocol = "tcp"
	    cidr_blocks = ["0.0.0.0/0"]
    }
    #Allowing https request from internet
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    #Allowing SSH request from internal network
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    #Allowing mysql request to db instance
    egress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["${var.private_subnet}"]
    }
}

## Security Group for ELB
resource "aws_security_group" "sg_elb" {
  name = "SG ELB"
  egress {
    from_port = 8080
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}