# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my-gw"
  }
}




# NAT  Gateway
# Create EIP(elastic IP)  for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}


resource "aws_nat_gateway" "natgw" {

  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]

}

