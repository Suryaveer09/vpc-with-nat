resource "aws_instance" "Windows-Instance" {
    subnet_id = aws_subnet.public_subnet.id
    ami = var.Win-ami
    instance_type = var.instance_type_t3_micro
    get_password_data = true
    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 30
        volume_type = "gp3"
        delete_on_termination = true
    }

    vpc_security_group_ids = [aws_security_group.Windows_SG.id]
    key_name = aws_key_pair.Surya_key.id

    tags = {
        Name = "${random_pet.surya_pet.id}-win"
    }
}

resource "aws_eip_association" "Windows_eip_assoc" {
    instance_id = aws_instance.Windows-Instance.id
    allocation_id = aws_eip.WIN_eip.id
}