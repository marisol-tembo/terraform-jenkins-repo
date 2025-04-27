resource "aws_vpc" "jen_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "jen_dev_vpc"
  }
}
