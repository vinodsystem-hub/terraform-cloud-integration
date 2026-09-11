 variable "instance" {
  description = "ec2 instance to be created"
  type = map(object({
    instance_type     = string
    availability_zone = string
    subnet_key        = string #subnet key is an predefined varaibles in terrafrom which collect all the subnet you have created from the state file 
  }))
  default = {
    web1 = {
      instance_type     = "t3.large"
      availability_zone = "us-east-1a"
      subnet_key        = "subnet1"
    }
    web2 = {
      instance_type     = "t3.large"
      availability_zone = "us-east-1b"
      subnet_key        = "subnet2"
    }
    web3 = {
      instance_type     = "t3.large"
      availability_zone = "us-east-1c"
      subnet_key        = "subnet3"
    }
  }
}
