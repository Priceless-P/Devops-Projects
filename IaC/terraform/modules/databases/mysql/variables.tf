variable "instance_class" {
    description = "db Instance"
    default = "db.t3.micro"
}

variable "engine" {
  description = "DB Engine"
  default = "mysql"
}

variable "engine_version" {
    description = "DB engine version"
    default = "8.0.33"
}

variable "db_name" {
  description = "DB name"
  default = "product_service_db"
}

variable "username" {
  description = "DB username"
  default = "product_service"
}

variable "password" {
  description = "DB password"
  default = "12345678"
}

variable "storage_type" {
  description = "DB storage type"
  default = "gp2"
}

variable "allocated_storage" {
  description = "DB allocated storage size in GB"
  default = 20
}

variable "user_service_security_group_db" {
  description = "User service security group"
}

variable "db_subnet_group" {
  description = "Product subnet froup name"
}
