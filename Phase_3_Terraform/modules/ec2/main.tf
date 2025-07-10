resource "aws_instance" "my_instance" {
    ami             = var.ami
    instance_type   =  var.instance_type
}

resource "aws_dns_record" "my_public_record"{
    zone_id = var.zone_id
    name    = var.zone_name
    type    = "A"
    ttl     = 300
    records = [aws_instance.my_instance.public_ip]
}