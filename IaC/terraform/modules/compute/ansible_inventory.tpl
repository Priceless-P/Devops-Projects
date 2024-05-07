[user_service_servers]
${user_instance} ansible_ssh_user=ec2-user ansible_ssh_private_key_file=/Users/prisca/.ssh/user_service_key.pem

[product_service_servers]
${product_instance} ansible_ssh_user=ec2-user ansible_ssh_private_key_file=/Users/prisca/.ssh/product_service_key.pem
