resource "aws_lb" "web_lb" {
  name               = "${local.project_tags.Name}-web-alb"
  internal           = false         #this will be internet facing 
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