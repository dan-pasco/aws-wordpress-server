# Declare AWS Provider and CLI Credentials
provider "aws" {
  region     = "ap-southeast-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

# DECLARED ACCESS KEY AND SECRET KEY AS VARIABLE. SECURED LIKE A USERNAME AND PASSWORD
variable "access_key" {
  description = "Access Key For AWS Cli"
}

variable "secret_key" {
  description = "Secret Key for AWS Cli"
  
}

