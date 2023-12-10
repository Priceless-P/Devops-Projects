resource "aws_security_group" "user_service_security_group" {
  name = "user_service_security_group"
  description = "Allow SSH, HTTP, and HTTPS traffic from anywhere"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_" {
    description = "Allow SSH traffic"
    from_port = 22
    to_port = 22
    ip_protocol  = "tcp"
    cidr_ipv4  = var.cidr_block
    security_group_id = aws_security_group.user_service_security_group.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    description = "Allow HTTP traffic"
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr_ipv4  = var.cidr_block
    security_group_id = aws_security_group.user_service_security_group.id
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
    description = "Allow HTTPS access"
    from_port = 443
    to_port = 443
    ip_protocol = "tcp"
    cidr_ipv4 = var.cidr_block
    security_group_id = aws_security_group.user_service_security_group.id
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_all" {
    description = "Allow all outbound traffic"
    ip_protocol = "-1"
    cidr_ipv4 = var.cidr_block
    security_group_id = aws_security_group.user_service_security_group.id
}

resource "aws_security_group" "user_service_security_group_db" {
    name = "user_service_security_group_db"
    description = "User service security group for db"
    vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_traffic_from__vpc" {
    description = "Allow Traffic from VPC"
    from_port = 3306
    to_port = 3306
    ip_protocol = "tcp"
    cidr_ipv4 = var.cidr_block
    security_group_id = aws_security_group.user_service_security_group_db.id
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound_all_" {
    description = "Allow all outbound traffic"
    ip_protocol = "-1"
    cidr_ipv4 = var.cidr_block
    security_group_id = aws_security_group.user_service_security_group_db.id
}
