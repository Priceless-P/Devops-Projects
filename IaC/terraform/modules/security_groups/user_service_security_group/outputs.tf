output "user_service_security_group_id" {
  value = aws_security_group.user_service_security_group.id
}

output "user_service_security_group_db_id" {
    value = aws_security_group.user_service_security_group_db.id
}