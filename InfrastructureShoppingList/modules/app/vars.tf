variable "amis"  {
	description = "windows_2012"
}

variable "instance_type" {
    description = "instance type"
}

variable "instance_class" {
    description = "db instance class"
    default     = "db.t2.small"
}
