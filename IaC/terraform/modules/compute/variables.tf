variable "user_service_key_name" {
  description = "User service instance Key name"
  default = "user_service_key"
}

variable "product_service_key_name" {
  description = "Product service instance key name"
  default = "product_service_key"
}

variable "ami" {
  description = "Instance ami"
  default = "ami-0230bd60aa48260c6"
}

variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}

variable "security_groups_product" {
    description = "product_service_security_group"
}

variable "security_groups_user" {
    description = "user_service_security_group"
}

variable "user_subnet_id" {
    description = "User subnet ID"
}

variable "product_subnet_id" {
    description = "Product subnet ID"
}
