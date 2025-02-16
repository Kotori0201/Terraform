provider "aws" {
  region = var.region
}

# Tạo VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "ta-igw"
  }

  depends_on = [ aws_vpc.my-vpc ]
}
