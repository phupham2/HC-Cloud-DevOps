## Creating Launch Configuration
resource "aws_launch_configuration" "myrounding_launchconfig" {
  image_id               = "${lookup(var.amis,var.region)}"
  instance_type          = "t2.micro"
  security_groups        = "${aws_security_group.myrounding_sg_instance.id}"
  key_name               = "${aws_key_pair.myrounding_ssh.key_name}"

 lifecycle {
    create_before_destroy = true
  }
}
## Creating AutoScaling Group
resource "aws_autoscaling_group" "myrounding_as" {
  launch_configuration = "${aws_launch_configuration.myrounding_launchconfig.id}"
  availability_zones = ["${data.aws_availability_zones.myrounding_useast_az.names}"]
  min_size = 2
  max_size = 6
  load_balancers = ["${aws_elb.myrounding_elb.name}"]
  health_check_type = "ELB"
  tag {
    key = "Name"
    value = "myrounding auto scalling"
    propagate_at_launch = true
  }
}
