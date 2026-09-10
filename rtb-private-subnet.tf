resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.my_vpc.id




  tags = {
    Name = "${local.project_tags.Name}-private-rtb"

  }
}

#once we create the route table we need to associate it with the subnet so that the subnet can use this route table to send traffic to internet gateway
resource "aws_route_table_association" "private_rtb_association" {
  for_each       = aws_subnet.db_subnet #this contains all the ids inside my state file
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_rtb.id

}