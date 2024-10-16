resource "aws_instance" "sample_server" {
  ami = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "sample-server"
  }

  disable_api_termination = true
  monitoring = true
}

resource "aws_ec2_instance_state" "stopped" {
  instance_id = aws_instance.sample_server.id
  state = "stopped"
}
