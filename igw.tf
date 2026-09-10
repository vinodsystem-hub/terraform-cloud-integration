resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id #from where we will get the vpc id

  tags = {
    Name = "${local.project_tags.Name}-igw"

  }
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}
