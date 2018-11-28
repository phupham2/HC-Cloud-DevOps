
#Launching database instance
resource "aws_db_instance" "myrounding_mysql_db" {
  depends_on             = ["aws_security_group.myrounding_sg_db"]
  allocated_storage      = "${var.storage}"
  engine                 = "${var.engine}"
  engine_version         = "${lookup(var.engine_version, var.engine)}"
  instance_class         = "${var.instance_class}"
  name                   = "${var.db_name}"
  username               = "${var.username}"
  password               = "${var.password}"
  vpc_security_group_ids = "${aws_security_group.myrounding_sg_db.id}"
  db_subnet_group_name   = "${aws_db_subnet_group.myrounding_db_subnet_group.id}"
}

#Database subnet group
resource "aws_db_subnet_group" "myrounding_db_subnet_group" {
  subnet_ids = ["${aws_subnet.myrounding_subnet_private.id}"]
}
