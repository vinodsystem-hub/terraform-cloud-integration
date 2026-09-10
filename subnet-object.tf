variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    subnet_type       = string
  }))
  default = {
    subnet1 = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "us-east-1a"
      subnet_type       = "public"
    }
    subnet2 = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "us-east-1b"
      subnet_type       = "public"
    }
    subnet3 = {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "us-east-1c"
      subnet_type       = "public"
    }
  }
}