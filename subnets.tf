resource "aws_subnet" "my-private-subnet" {
  vpc_id = aws_vpc.my-vpc.id

  count = length(var.private_subnet_cidr)
  
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.AZ[count.index % length(var.AZ)]
  map_public_ip_on_launch = true

  tags = {
    Name = "ta-private-subnet-${count.index + 1}"
    Type = "public"
  }

  depends_on = [ aws_vpc.my-vpc ]
}


resource "aws_subnet" "my-public-subnet" {
  vpc_id = aws_vpc.my-vpc.id

  count = length(var.public_subnet_cidr)

  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.AZ[count.index % length(var.AZ)]
  map_public_ip_on_launch = true

  tags = {
    Name = "ta-public-subnet-${count.index + 1}"
    Type = "public"
  }

  depends_on = [ aws_vpc.my-vpc ]
}