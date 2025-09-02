resource "tls_private_key" "Surya_Private_Key" {
    algorithm = "RSA"
    rsa_bits = 4096
}


resource "aws_key_pair" "Surya_key" {
    key_name = "Windows-${random_pet.surya_pet.id}"
    public_key = tls_private_key.Surya_Private_Key.public_key_openssh
}

resource "local_file" "Surya_Private_key_pem" {
    filename = "${random_pet.surya_pet.id}-private-key.pem"
    content = tls_private_key.Surya_Private_Key.private_key_pem
}

resource "local_file" "Surya_Public_Key" {
    filename = "${random_pet.surya_pet.id}-public-key.pem"
    content = tls_private_key.Surya_Private_Key.public_key_pem
}