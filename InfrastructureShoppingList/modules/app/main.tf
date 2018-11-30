resource "aws_launch_configuration" "studer_launchconfig" {
  image_id               = "${lookup(var.amis)}"
  instance_type          = "${var.instance_type}"
  security_groups        = "${aws_security_group.studer_sg.id}"
  key_name               = "${aws_key_pair.studer_ssh.key_name}"
  ebs_block_device      = [
      {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "256"
      delete_on_termination = true
      },
  ]
  lifecycle {
    create_before_destroy = true
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
## Creating AutoScaling Group
resource "aws_autoscaling_group" "studer_as" {
  launch_configuration = "${aws_launch_configuration.studer_launchconfig.id}"
  availability_zones = ["${data.aws_availability_zones.studer_useast_az.names}"]
  min_size = 1
  max_size = 6
  load_balancers = ["${aws_elb.studer_elb.name}"]
  health_check_type = "ELB"
  tags {
    key = "Name"
    value = "studer-${count.index}"
    propagate_at_launch = true
  }
}

resource "aws_elb" "studer_elb" {
    name = "studer_elb"
    security_groups = ["${aws_security_group.studer_elb.id}"]
    availability_zones = ["${data.aws_availability_zones.all.names}"]

    health_check {
        healthy_threshold = 1
        unhealthy_threshold = 1
        timeout = 3
        interval = 30
        target = "HTTP:${var.server_port}/"
    }
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
resource "aws_db_instance" "default" {
  allocated_storage    = 256
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "${var.instance_class}"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
}
