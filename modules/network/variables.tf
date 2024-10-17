variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16" // TODO: Change
}

variable "public_subnet_cidrs" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24", // TODO: Change
  ]
}

variable "private_subnet_cidrs" {
  default = [
    "10.0.3.0/24",
    "10.0.4.0/24", // TODO: Change
  ]
}
