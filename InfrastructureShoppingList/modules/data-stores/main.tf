#s3 bucket
data "aws_s3_bucket" "studer" {
  bucket = "var.${data.aws_s3_bucket.studer}"
  #key   = ""
}
data "aws_route53_zone" "test_zone" {
  name = "${var.aws_route53_zone}"
}

resource "aws_route53_record" "studer_s3" {
  zone_id = "${data.aws_route53_zone.test_zone.id}"
  name    = "bucket"
  type    = "A"

  alias {
    name    = "${data.aws_s3_bucket.selected.website_domain}"
    zone_id = "${data.aws_s3_bucket.selected.hosted_zone_id}"
  }
}
#databases RDS
resource "aws_db_instance" "default" {
  allocated_storage    = "${var.allocated_storage}"
  storage_type         = "gp2"
  engine               = "${var.engine}"
  engine_version       = "5.7"
  instance_class       = "${var.instance_class}"
  name                 = "mydb"
  username             = "${var.username}"
  password             = "${var.password}"
  parameter_group_name = "default.mysql5.7"
}