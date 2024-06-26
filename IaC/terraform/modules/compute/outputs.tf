output "product_service_public_ip" {
  value = aws_instance.product_service_instance.public_ip
}

output "user_service_public_ip" {
  value = aws_instance.user_service_instance.public_ip
}
output "product_service_ip" {
  value = aws_instance.product_service_instance.public_ip
}

output "ansible_inventory" {
  value = data.template_file.ansible_inventory.rendered
}
