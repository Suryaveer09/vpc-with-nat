resource "random_pet" "surya_pet" {
    length = 3
}

resource "random_password" "surya_password" {
    length = 15
    special = true
}

resource "random_id" "surya_id" {
    byte_length = 8
}

resource "random_integer" "surya_integer" {
    min = 10
    max = 100
}

resource "random_string" "surya_string" {
    length = 10
    upper = true
    special = true
}

resource "random_uuid" "surya_uuid" {
    
}

resource "random_shuffle" "Random_Region" {
  input        = ["us-east-1", "us-east-2"]
  result_count = 1
}