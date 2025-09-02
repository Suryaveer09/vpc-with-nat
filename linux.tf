resource "aws_instance" "Linux-Instance" {
    subnet_id = aws_subnet.private_subnet.id
    ami = var.Linux-ami
    instance_type = var.instance_type_t3_micro
    ebs_block_device {
        device_name = "/dev/xvda"
        volume_size = 30
        volume_type = "gp3"
        delete_on_termination = true
    }

    vpc_security_group_ids = [aws_security_group.Linux_SG.id]
    key_name = aws_key_pair.Surya_key.id

    tags = {
        Name = "${random_pet.surya_pet.id}-linux"
    }
}
