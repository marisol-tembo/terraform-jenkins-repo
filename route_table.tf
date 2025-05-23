resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.jen_vpc.id

  tags = {
    Name = "dev_pub_rt"
  }
}
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.pub_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway_terr.id
}
