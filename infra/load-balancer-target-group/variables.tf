variable "lb_target_group_name" {
  type = string
}

variable "lb_target_group_port" {
  type = number
}

variable "lb_target_group_protocol" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ec2_instance_id" {
  type = string
}
