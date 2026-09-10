terraform {
  backend "s3" {
    bucket       = "vinod-lab-s3"          #change it to your bucket name
    key          = "dev/terraform.tfstate" #inside s3 bucket it will create a folder dev and inside that it will store your tfstate file
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true #the imp part is the lock file this will enable s3 state locking
  }
}