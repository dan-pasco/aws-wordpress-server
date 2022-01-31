# Declare AWS Provider and CLI Credentials
provider "aws" {
  region     = "ap-southeast-2"
  }


resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"
  
  tags = {
    Name = "main"
  }
}
