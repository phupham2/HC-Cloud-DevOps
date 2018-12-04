provider "aws" {
  region                  = "eu-west-3"
  shared_credentials_file = "/c/Users/%user%/.aws/credentials"
  profile                 = "terraform"
}


/*resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags {
      tag-key = "tag-value"
  }
}
*/

/*
data "aws_s3_bucket" "default" {
  bucket = "var.${data.aws_s3_bucket.studer}"
  #key   = ""
}
data "aws_route53_zone" "test_zone" {
  name = "${var.aws_route53_zone}"
}
# route 53 resource
resource "aws_route53_record" "default" {
  zone_id = "${data.aws_route53_zone.test_zone.id}"
  name    = "bucket"
  type    = "A"

  alias {
    name    = "${data.aws_s3_bucket.selected.website_domain}"
    zone_id = "${data.aws_s3_bucket.selected.hosted_zone_id}"
  }
}
*/