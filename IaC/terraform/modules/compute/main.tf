resource "aws_key_pair" "user_service_key" {
    key_name = var.user_service_key_name
    public_key = file("${path.module}/user_service_key.pub")

}

resource "aws_key_pair" "product_service_key" {
    key_name = var.product_service_key_name
    public_key = file("${path.module}/product_service_key.pub")
}

resource "aws_instance" "user_service_instance" {
    security_groups = var.security_groups_user
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.user_service_key.key_name
    subnet_id = var.user_subnet_id
    associate_public_ip_address = true
}

resource "aws_instance" "product_service_instance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.product_service_key.key_name
    subnet_id = var.product_subnet_id
   security_groups = var.security_groups_product
}

data "template_file" "ansible_inventory" {
    template = file("${path.module}/ansible_inventory.tpl")
    vars = {
      user_instance = aws_instance.user_service_instance.id
      product_instance = aws_instance.product_service_instance.id
    }
}