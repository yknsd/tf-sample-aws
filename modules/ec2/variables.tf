variable "ami" {
  type = string
  default = "ami-03f584e50b2d32776"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "sg_ids" {
  type = list(string)
}
