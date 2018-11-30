resource "aws_launch_configuration" "studer_launchconfig" {
  image_id               = "${lookup(var.amis,var.region)}"
  instance_type          = "t2.micro"
  security_groups        = "${aws_security_group.studer_sg.id}"
  key_name               = "${aws_key_pair.studer_ssh.key_name}"

 lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "studer_sg"
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
## Creating AutoScaling Group
resource "aws_autoscaling_group" "studer_as" {
  launch_configuration = "${aws_launch_configuration.studer_launchconfig.id}"
  availability_zones = ["${data.aws_availability_zones.studer_useast_az.names}"]
  min_size = 1
  max_size = 6
  #load_balancers = ["${aws_elb.studer_elb.name}"]
  #health_check_type = "ELB"
  tag {
    key = "Name"
    value = "studer auto scalling"
    propagate_at_launch = true
  }
}

resource "aws_elb" "studer_elb"
    name = "studer_elb"
    availability_zones = ["${data.aws_availability_zones.all.names}"]

    listener {
        instance_port     = 8000
        instance_protocol = "http"
        lb_port           = 80
        lb_protocol       = "http"
    }

    listener {
        instance_port      = 8000
        instance_protocol  = "http"
        lb_port            = 443
        lb_protocol        = "https"
        #ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
    }

    health_check {
        healthy_threshold   = 2
        unhealthy_threshold = 2
        timeout             = 3
        target              = "HTTP:8000/"
        interval            = 30
    }

    instances                   = ["${aws_autoscaling_group.studer_as.id}"]
    cross_zone_load_balancing   = true
    idle_timeout                = 400
    connection_draining         = true
    connection_draining_timeout = 400

    tags {
        Name = "studer_elb"
    }
}