
variable "instance_class" {
    description = "db instance class"
    default     = "db.t2.small"
}


variable "aws_route53_zone" {
    description = ""
}

variable "allocated_storage" {
    description = "db storage space"
}

variable "username" {
    description = "username"
}

variable "password" {
    description = "password"
}

variable "engine" {
    description = "Db RDS engine"
}