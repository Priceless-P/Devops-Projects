output "ansible_inventory" {
  value = module.compute.ansible_inventory
}

output "user_db_endpoint_p" {
  value = module.user_service_mysql_db.db_endpoint
}
output "user_db_username_p" {
  value = module.user_service_mysql_db.db_username_u
}
output "user_db_password_p" {
  value = module.user_service_mysql_db.db_password_u
  sensitive = true
}
output "user_db_port_p" {
  value = module.user_service_mysql_db.db_port_u
}
output "user_db_name_p" {
  value = module.user_service_mysql_db.db_name_u
}