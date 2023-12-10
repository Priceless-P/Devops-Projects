output "vpc_id" {
    description = "VPC id"
    value = aws_vpc.ecom_vpc.id
}

output "vpc_arn" {
    description = "VPC ARN"
    value = aws_vpc.ecom_vpc.arn
}

output "user_subnet_id" {
    description = "User service subnet"
    value = aws_subnet.user_service_subnet.id
}

output "product_subnet_id" {
    description = "Product service subnet"
    value = aws_subnet.product_service_subnet.id
}

output "product_subnet_group" {
  value = aws_db_subnet_group.db_subnet_group.id
}
