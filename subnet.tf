resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.test_vpc.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true
    tags = {
      Name = "${var.env}-subnet"
    }
}
