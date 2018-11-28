## Security Group for ELB
resource "aws_security_group" "myrounding_sg_elb" {
  name = "Myrounding SG ELB"
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


