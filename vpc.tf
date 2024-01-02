provider "aws" {
  region     = "us-east-1"
}


resource "aws_vpc" "appvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "appvpc"
  }
}

# Create Public Subnet 1
resource "aws_subnet" "pubsub1" {
  vpc_id                  = aws_vpc.appvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsubnet1"
  }
}

# Create Public Subnet 2
resource "aws_subnet" "pubsub2" {
  vpc_id                  = aws_vpc.appvpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsubnet2"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.appvpc.id

  tags = {
    Name = "app-igw"
  }
}

resource "aws_route_table" "app-pubroute" {
  vpc_id = aws_vpc.appvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "apppub-rt"
  }
}

resource "aws_route_table_association" "pub1" {
  subnet_id      = aws_subnet.pubsub1.id
  route_table_id = aws_route_table.app-pubroute.id
}

# Public Subnet 2 Association
resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.pubsub2.id
  route_table_id = aws_route_table.app-pubroute.id
}
