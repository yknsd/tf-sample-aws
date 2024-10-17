resource "aws_instance" "sample_server_1" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  security_groups         = var.sg_ids
  subnet_id               = var.subnet_id

  disable_api_termination = true
  monitoring              = true

  tags = {
    Name = "sample-server-1"
  }
}

resource "aws_ec2_instance_state" "stopped_sample_server_1" {
  instance_id = aws_instance.sample_server_1.id
  state       = "stopped"
}
