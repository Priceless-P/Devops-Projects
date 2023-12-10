output "db_endpoint" {
  description = "MYSQL db enpoint"
  value = aws_db_instance.user_service.endpoint
}
