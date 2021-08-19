resource "aws_lb_target_group" "test" {
  name     = "190821tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-3050a35b"
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:251107607969:targetgroup/190821tg/0246a7504c22cb11"
  target_id        = "i-063a398e4886f97ff"
  port             = 80
}