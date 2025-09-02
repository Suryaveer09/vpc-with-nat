output "NAT_Public_IP" {
    value = aws_eip.nat_eip.public_ip
}

output "NAT_Private_IP" {
    value = aws_eip.nat_eip.private_ip
}

output "random_pet" {
    value = random_pet.surya_pet.id
}

output "random_id_b64_std" {
    value = random_id.surya_id.b64_std
}

output "random_id_b64_url" {
    value = random_id.surya_id.b64_url
}

output "random_id_byte_length" {
    value = random_id.surya_id.byte_length
}

output "random_id_dec" {
    value = random_id.surya_id.dec
}

output "random_id_hex" {
    value = random_id.surya_id.hex
}

output "random_id" {
    value = random_id.surya_id.id
}

output "random_id_keepers" {
    value = random_id.surya_id.keepers
}

output "random_id_prefix" {
    value = random_id.surya_id.prefix
}

output "random_integer" {
    value = random_integer.surya_integer.id
}

output "random_integer_Keepers" {
    value = random_integer.surya_integer.keepers
}

output "random_integer_max" {
    value = random_integer.surya_integer.max
}

output "random_integer_min" {
    value = random_integer.surya_integer.min
}

output "random_integer_result" {
    value = random_integer.surya_integer.result
}

output "random_integer_seed" {
    value = random_integer.surya_integer.seed
}

output "Windows-instance_id" {
    value = aws_instance.Windows-Instance.id
}

output "Windows-public_ip" {
    value = aws_instance.Windows-Instance.public_ip
}

output "Windows-private_ip" {
    value = aws_instance.Windows-Instance.private_ip
}

output "Linux-instance_id" {
    value = aws_instance.Linux-Instance.id
}

output "Linux-public_ip" {
    value = aws_instance.Linux-Instance.public_ip
}

output "Linux-private_ip" {
    value = aws_instance.Linux-Instance.private_ip
}

output "aws_key_pair" {
    value = aws_key_pair.Surya_key.key_name
}

output "my_ip" {
    value = local.home_ip
}

output "Surya_web_server_encrypted_pwd" {
  value = aws_instance.Windows-Instance.get_password_data
  sensitive = false  
}
resource "local_file" "Surya_encrpt_pwd" {
  filename = "Surya_Windows_encrypted_password.txt"
  content = aws_instance.Windows-Instance.password_data
  
  provisioner "local-exec" {
    command = "echo ${local_file.Surya_encrpt_pwd.content}| base64 -d | openssl pkeyutl -decrypt -inkey ./${local_file.Surya_Private_key_pem.filename} -out Surya_decrypt_password.txt"
  }
}


output "reachable" { 
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.path_found 
}

output "status" { 
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.status
}

output "explanations" {
    value = aws_ec2_network_insights_analysis.home_to_ec2_analysis.explanations
}


