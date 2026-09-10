resource "aws_subnet" "web_subnet" {
  for_each          = var.subnets       #it contains what varaibles subnet 123
  vpc_id            = aws_vpc.my_vpc.id #it will read it from state file
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  #map_public_ip_on_launch = true
  tags = {
    Name = "${local.project_tags.Name}-${each.key}"

  }
}