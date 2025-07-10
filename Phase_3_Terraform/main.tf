module "ec2" {
    for_each        = var.instances
    source          = "./modules/ec2"
    ami             = var.ami
    instance_type   =  each.value["instance_type"]
    zone_id         = var.zone_id
   
    tags            = {
        Name = "${each.key}-${var.env}"
    }

}