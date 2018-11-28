
### Creating ELB
resource "aws_elb" "myrounding_elb" {
  name = "myrounding_sg_elb"
  subnets         = "${aws_subnet.myrounding_subnet_public.id}"
  instances       = "${aws_instance.myrounding_instance.id}"
  security_groups = "${aws_security_group.myrounding_sg_elb.id}"
  availability_zones = "${data.aws_availability_zones.myrounding_useast_az.names}"
  
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "8080"
    instance_protocol = "http"
  }
  listener {
    lb_port = 443
    lb_protocol = "https"
    instance_port = "8080"
    instance_protocol = "http"
  }
}

#resource "aws_proxy_protocol_policy" "ProxyProtocol" {
#  load_balancer = "${aws_elb.myrounding_elb.name}"
#  instance_ports = ["8080"]
#}