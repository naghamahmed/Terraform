resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-subnet1_CIDR_block
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone_1
  tags = {
    Name = "Public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public-subnet2_CIDR_block
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone_2
  tags = {
    Name = "Public2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-subnet1_CIDR_block
  availability_zone = var.availability_zone_1
  tags = {
    Name = "Private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private-subnet2_CIDR_block
  availability_zone = var.availability_zone_2
  tags = {
    Name = "Private2"
  }
}