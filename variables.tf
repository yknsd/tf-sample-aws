variable "region" {
  type = string
  default = "ap-northeast-1"
}

variable "access_key" {
  type = string
  sensitive = true
}

variable "secret_key" {
  type = string
  sensitive = true
}

variable "aws_lb_listener_security_policy" {
  type = string
  default = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}
