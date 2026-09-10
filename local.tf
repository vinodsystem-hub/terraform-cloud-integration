locals {
  project_tags = { #it is the name of the local variable which is user defined
    Name = "${var.project_name}-${var.environment}"
    # "vinod-project"-dev
    Project     = var.project_name
    Environment = var.environment
  }
}