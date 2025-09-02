resource "aws_eip" "nat_eip" {
    domain = "vpc"
    tags = {
        Name = "${random_pet.surya_pet.id}-NAT"
    }
}

resource "aws_eip" "WIN_eip" {
    domain = "vpc"
    tags = {
        Name = "${random_pet.surya_pet.id}-WIN"
    }
}