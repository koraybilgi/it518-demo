variable "aws_access_key" {
  default = "XXX"
}

variable "aws_secret_key" {
  default = "XXX"
}

variable "aws_region" {
  default = "eu-west-1"
}


variable "aws_pub_location" {
  default = "/vagrant/.keypairs/aws.pem.pub"
}

variable "aws_pem_location" {
  default = "/vagrant/.keypairs/aws.pem"
}
