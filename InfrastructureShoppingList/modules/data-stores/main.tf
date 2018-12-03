#s3 bucket
resource "aws_s3_bucket" "default" {
  bucket = "${var.s3_bucket_name}"
  acl    = "${var.s3_bucket_acl}"

  tags {
    Name        = "${var.s3_bucket_name}"
    Environment = "${var.env}"
  }
}

#databases RDS
resource "aws_db_instance" "default" {
  allocated_storage    = "${var.allocated_storage}"
  storage_type         = "${var.storage_type}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  name                 = "${var.name}"
  username             = "${var.username}"
  password             = "${var.password}"
  # vpc_security_group_ids = "${aws_security_group.myrounding_sg_db.id}"
  # db_subnet_group_name   = "${aws_db_subnet_group.myrounding_db_subnet_group.id}"
  # parameter_group_name = "default.mysql5.7"
}