resource "aws_instance" "web_vm" {
  for_each                    = var.instance
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = each.value.instance_type                        #t2 micro instance
  subnet_id                   = aws_subnet.web_subnet[each.value.subnet_key].id #this is where we are geeting private ip of the instance
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  user_data                   = file("${path.module}/app.sh")
  # user_data = file(C:\Users\gopal\OneDrive\Desktop\terraform-project\app.sh)

  #path.module is an meta argument in terraform this will look for a file in current directory


  tags = {
    Name        = "${local.project_tags.Name}-${each.key}"
    Project     = var.project_name
    Environment = var.environment

  }
}

output "instance_details" {
  description = "details of the instance"
  value = {
    for key, instance in aws_instance.web_vm :
    key => {
      instance_id       = instance.id
      instance_type     = instance.instance_type
      availabiltiy_zone = instance.availability_zone
      subnet_id         = instance.subnet_id
      private_ip        = instance.private_ip
      public_ip         = instance.public_ip
    }
  }
}
