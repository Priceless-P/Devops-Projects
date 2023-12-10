resource "aws_security_group" "product_service_security_group" {
    name = "product_service_security_group"
    description = "Allow SSH traffic"
    vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    description = "Allow SSH traffic"
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr_ipv4 = var.cidr_block
    security_group_id = aws_security_group.product_service_security_group.id
}

resource "aws_security_group" "product_service_security_group_db" {
    name = "product_service_security_group_db"
    description = "Allow app traffic to db"
    vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_traffic_from_vpc" {
    description = "Allow Traffic from VPC"
    from_port = 3306
    to_port = 3306
    ip_protocol = "tcp"
    cidr_ipv4 = var.cidr_block
    security_group_id = aws_security_group.product_service_security_group_db.id
}
resource "aws_vpc_security_group_egress_rule" "allow_outbound_all" {
    description = "Allow all outbound traffic"
    ip_protocol = "-1"
    cidr_ipv4 = var.cidr_block
    security_group_id = aws_security_group.product_service_security_group_db.id
}
