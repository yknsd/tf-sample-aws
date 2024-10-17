variable "vpc_id" {
  type = string
}

variable "access_log_s3_bucket_id" {
  type = string
}

variable "ec2_sample_server_1_id" {
  type = string
}

variable "lb_listener_security_policy" {
  type = string
  default = "ELBSecurityPolicy-2016-08"
}

variable "alb_security_group_id" {
  type = string
}

variable "alb_subnets" {
  type = list(string)
}
