/*************************
 Application Load Balancer

 Document: https://docs.aws.amazon.com/ja_jp/elasticloadbalancing/latest/application/introduction.html
 *************************/
resource "aws_lb" "example_alb" {
  name                       = "tf-alb-example"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.alb_security_group_id]

  subnets                    = var.alb_subnets

  drop_invalid_header_fields = true
  enable_deletion_protection = true

  idle_timeout = 60

  access_logs {
    bucket  = var.access_log_s3_bucket_id
    prefix  = "log"
    enabled = false
  }
  tags = {
    Name = "tf-alb-example"
  }
}

/**********
 Target group
 **********/
resource "aws_lb_target_group" "example_alb_tg_1" {
  vpc_id      = var.vpc_id
  name        = "tf-example-lb-alb-tg-1"
  target_type = "alb"
  port        = 80
  protocol    = "HTTP"
}

resource "aws_lb_target_group_attachment" "example_alb_tg_1_server_1" {
  target_group_arn  = aws_lb_target_group.example_alb_tg_1.arn
  target_id         = var.ec2_sample_server_1_id
  port              = 80
}

/**********
 Listener
 - Set the target group to which traffic will be forwarded
 **********/
resource "aws_lb_listener" "app" {
  load_balancer_arn   = aws_lb.example_alb.arn
  protocol            = "HTTP"
//  ssl_policy = var.lb_listener_security_policy

  default_action {
    type              = "forward"
    target_group_arn  = aws_lb_target_group.example_alb_tg_1.arn
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn        = aws_lb_listener.app.arn
  priority            = 100

  action {
    type = "forward"
    target_group_arn  = aws_lb_target_group.example_alb_tg_1.arn
  }

  condition {
    path_pattern {
      values = [
        "/static/*"
      ]
    }
  }

  condition {
    host_header {
      values = [
        "example.com"
      ]
    }
  }
}
