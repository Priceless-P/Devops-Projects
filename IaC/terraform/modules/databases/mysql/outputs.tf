output "db_endpoint" {
  description = "MYSQL db enpoint"
  value = aws_db_instance.user_service.endpoint
}

output "db_username_u" {
  description = "MYSQL username"
  value = aws_db_instance.user_service.username
}

output "db_password_u" {
  description = "MYSQL password"
  value = aws_db_instance.user_service.password
}

output "db_port_u" {
  description = "MYSQL password"
  value = aws_db_instance.user_service.port
}
output "db_name_u" {
  description = "MYSQL username"
  value = aws_db_instance.user_service.db_name
}