variable "aws_region" {
  description = "aws region where resoure are created"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "aws vpc name where resoure are created"
  type        = string
  default     = "gopal-vpc"
}

variable "subnet_name" {
  description = "aws subnet name where resoure are created"
  type        = string
  default     = "gopal-subnet"
}

variable "subnet_cidr" {
  description = "aws subnet CIDR block where resoure are created"
  type        = string
  default     = "10.0.1.0/24"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
  default     = "vinod-project"
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
  default     = "dev"
}
