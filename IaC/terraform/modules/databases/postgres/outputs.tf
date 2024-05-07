output "db_endpoint_p" {
  description = "Postgres db endpoint"
  value = aws_db_instance.product_service.endpoint
}

output "db_username_p" {
  description = "Postgres username"
  value = aws_db_instance.product_service.username
}

output "db_password_p" {
  description = "Postgres password"
  value = aws_db_instance.product_service.password
}

output "db_port_p" {
  description = "Postgres password"
  value = aws_db_instance.product_service.port
}

output "db_name_p" {
  description = "Postgres dbname"
  value = aws_db_instance.product_service.db_name
}