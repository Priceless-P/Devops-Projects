output "product_service_security_group_id" {
  value = aws_security_group.product_service_security_group.id
}

output "product_service_security_group_db_id" {
  value = aws_security_group.product_service_security_group_db.id
}