[user_service_servers]
${aws.aws_instance.user_service_instance.public_ip} ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/user_service_key.pub

[product_service_servers]
${aws.aws_instance.product_service_instance.public_ip} ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/product_service_key.pub
