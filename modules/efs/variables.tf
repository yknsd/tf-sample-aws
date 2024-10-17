// https://docs.aws.amazon.com/efs/latest/ug/performance.html#performancemodes
variable "performance_mode" {
  type = string
  default = "generalPurpose"
}

// https://docs.aws.amazon.com/efs/latest/ug/performance.html#throughput-modes
variable "throughput_mode" {
  type = string
  default = "bursting"
}

variable "subnets" {
  type = list(string)
  default = ["subnet-12345678"] // TODO: Change
}

variable "sg_ids" {
  type = list(string)
}
