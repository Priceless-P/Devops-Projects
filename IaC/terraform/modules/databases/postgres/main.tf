resource "aws_db_instance" "product_service" {
  engine = var.engine
  engine_version = var.engine_version
  db_name = var.db_name
  username = var.username
  password = var.password
  instance_class = var.instance_class
  storage_type = var.storage_type
  allocated_storage = var.allocated_storage
  skip_final_snapshot = true
  db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = var.product_service_security_group
}
