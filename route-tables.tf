resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "ta-public-route-table"
  }

  depends_on = [ aws_vpc.my-vpc ]
}

resource "aws_route_table_association" "public_association" {
  route_table_id = aws_route_table.public.id
  
  count = length(var.public_subnet_cidr)
  subnet_id = aws_subnet.my-public-subnet[count.index].id  

  depends_on = [ aws_subnet.my-public-subnet ]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "ta-private-route-table"
  }

  depends_on = [ aws_vpc.my-vpc ]

}

resource "aws_route_table_association" "private_association" {
  route_table_id = aws_route_table.private.id
  
  count = length(var.private_subnet_cidr)
  subnet_id = aws_subnet.my-private-subnet[count.index].id  

  depends_on = [ aws_subnet.my-private-subnet ]
}