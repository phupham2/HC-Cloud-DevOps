variable "amis"  {
	description = "instance ami"
}

variable "instance_type" {
    description = "instance type"
}

variable "min_size" {
    description = "min size count"
    default     = 1
}

variable "max_size" {
    description = "max size count"
    default     = 6
}

variable "desired_capacity" {
    description = "desired_capacity"
    default     = 1
}

variable "volume_size" {
    description = "EBS volume size"
    default     = "25"
}
variable "env" {
    description = "environment"
}