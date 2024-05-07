resource "aws_vpc" "ecom_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = var.vpc_tags
  enable_dns_hostnames = true
  enable_dns_support = true
}

# User service subnet
resource "aws_subnet" "user_service_subnet" {
  vpc_id = aws_vpc.ecom_vpc.id
  cidr_block = var.subnet_cidr_a
  availability_zone = "us-east-1a"
}

# Product service subnet
resource "aws_subnet" "product_service_subnet" {
  vpc_id = aws_vpc.ecom_vpc.id
  cidr_block = var.subnet_cidr_b
  availability_zone = "us-east-1b"
}

# User service DB subnet
resource "aws_subnet" "user_service_subnet_db" {
  vpc_id = aws_vpc.ecom_vpc.id
  cidr_block = var.subnet_cidr_a_db
  availability_zone = "us-east-1a"
}

# Product service DB subnet
resource "aws_subnet" "product_service_subnet_db" {
  vpc_id = aws_vpc.ecom_vpc.id
  cidr_block = var.subnet_cidr_b_db
  availability_zone = "us-east-1b"
}

resource "aws_internet_gateway" "n_getway" {
    vpc_id = aws_vpc.ecom_vpc.id
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.ecom_vpc.id
}

resource "aws_route" "private_route" {
    gateway_id = aws_internet_gateway.n_getway.id
    route_table_id = aws_route_table.private_route_table.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "resource_association_product" {
    subnet_id = aws_subnet.product_service_subnet.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "resource_association_user" {
    subnet_id = aws_subnet.user_service_subnet.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_db_subnet_group" "db_subnet_group" {
 name = "db_subnet_group"
 description = "DB subnet group"
 subnet_ids = [aws_subnet.product_service_subnet_db.id, aws_subnet.user_service_subnet_db.id]
}
