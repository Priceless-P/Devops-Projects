resource "aws_db_instance" "user_service" {
  instance_class = var.instance_class
  engine = var.engine
  engine_version = var.engine_version
  allocated_storage = var.allocated_storage
  storage_type = var.storage_type
  username = var.username
  db_name = var.db_name
  password = var.password
  skip_final_snapshot = true
  db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = var.user_service_security_group_db
}
