variable "vpc_cidr_block" {
  description = "CIDR block"
  default = "10.0.0.0/16"
}

variable "vpc_tags" {
  description = "Tags for VPC"
  type = map(string)
  default = {
    "Name" = "ecom_vpc"
  }
}

variable "subnet_cidr_a" {
    description = "Subnet CIDR"
    default = "10.0.1.0/24"
}

variable "subnet_cidr_b" {
    description = "Subnet CIDR"
    default = "10.0.2.0/24"
}

variable "subnet_cidr_a_db" {
    description = "Subnet CIDR"
    default = "10.0.3.0/24"
}

variable "subnet_cidr_b_db" {
    description = "Subnet CIDR"
    default = "10.0.4.0/24"
}