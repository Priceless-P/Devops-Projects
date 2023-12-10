output "db_endpoint" {
  description = "Postgres db endpoint"
  value = aws_db_instance.product_service.endpoint
}
