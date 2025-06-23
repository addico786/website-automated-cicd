resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.test_vpc.id

    route {
        gateway_id = aws_internet_gateway.test_igw.id
        cidr_block = "0.0.0.0/0"
    }
    tags = {
      Name = "${var.env}-routetable"
    }
}


resource "aws_route_table_association" "rt_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}