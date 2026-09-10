variable "private_subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    subnet_type       = string
  }))
  default = {
    subnet4 = {
      cidr_block        = "10.0.4.0/24"
      availability_zone = "us-east-1a"
      subnet_type       = "private"
    }
    subnet5 = {
      cidr_block        = "10.0.5.0/24"
      availability_zone = "us-east-1b"
      subnet_type       = "private"
    }
    subnet6 = {
      cidr_block        = "10.0.6.0/24"
      availability_zone = "us-east-1c"
      subnet_type       = "private"
    }
  }
}