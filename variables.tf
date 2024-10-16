variable "region" {
  type = string
  default = "asia-northeast-1"
}

variable "access_key" {
  type = string
  sensitive = true
}

variable "secret_key" {
  type = string
  sensitive = true
}
