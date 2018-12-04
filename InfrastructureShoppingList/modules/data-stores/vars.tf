
variable "instance_class" {
    description = "db instance class"
    default     = "db.t2.small"
}

variable "aws_route53_zone" {
    description = "aws route 53 zone"
}

variable "allocated_storage" {
    description = "db storage space"
}

variable "MasterUsername" {
    description = "username"
}

variable "password" {
    description = "password"
}

variable "db_port" {
    description = "db port"
}

variable "engine" {
    description = "Db RDS engine"
}

variable "name" {
  description   = "db name"
}

variable "engine_version" {
    description = "engine version of DB"
  
}
variable "storage_type" {
  description   = "storage type db"
  default       = "gp2"
}

variable "s3_bucket_name" {
    description = "s3 bucket name"
}

variable "s3_bucket_acl" {
    description = "s3 acl"
    default     = "private"
}

