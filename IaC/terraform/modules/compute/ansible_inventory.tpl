[user_service_servers]
${user_instance} ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/user_service_key.pub

[product_service_servers]
${product_instance} ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/product_service_key.pub
