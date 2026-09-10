/*
resource "aws_lb" "web_lb" {
  name        = "${local.project_tags.Name}-web-alb"
  internal           = false #this will be internet facing 
  load_balancer_type = "application" #we are creating application lb
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [for subnet in aws_subnet.web_subnet : subnet.id]

  enable_deletion_protection = false

  

tags = {
    Name = "${local.project_tags.Name}-web-sg"
   
  }
}

output "alb_dns_name" {
  value = aws_lb.web_lb.dns_name
}
*/
#we will create target group and attach instances behind tf 
resource "aws_lb_target_group" "web_tg" {
  name        = "${local.project_tags.Name}-web-alb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.my_vpc.id
  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 2 #every 30 second it is goign to ping your application server 1 min #if you server do not respond in a min it will stop sending the traffic
    unhealthy_threshold = 4
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
  tags = {
    Name = "${local.project_tags.Name}-web-sg-tg"

  }
}

#lets attach all the instance behind your lb
resource "aws_lb_target_group_attachment" "web_tg_attachement" {
  for_each         = aws_instance.web_vm
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id        = each.value.id

  port = 80
}