resource "aws_lb" "test" {
  name               = "suke-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-044084bbb32186d50"]
  subnets            = ["subnet-fdf0e895", "subnet-00561f4c"]


  access_logs {
    bucket  = "suketerraformbucket"
    prefix  = "190821"
  }

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-south-1:251107607969:loadbalancer/app/suke-alb/63c917baae0fc117"
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-south-1:251107607969:targetgroup/190821tg/0246a7504c22cb11"
  }
}