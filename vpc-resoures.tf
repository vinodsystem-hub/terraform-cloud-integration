resource "aws_vpc" "my_vpc" {
  #resource what resource we are create an aws_vpc
  #this my_vpc is kind of refrence block which is user defined
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}