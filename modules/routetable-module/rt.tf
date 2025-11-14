resource "aws_route_table" "r" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.destination_cidr_block
    gateway_id = var.gateway_id
  }

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }


  tags = {
    Name = var.rt_name
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.r.id
}