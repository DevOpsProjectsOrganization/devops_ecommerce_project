resource "aws_instance" "my_instance" {
    ami             = var.ami
    instance_type   =  var.instance_type
    tags            = {
        Name        = "${var.name}-${var.env}"
    }
    vpc_security_group_ids= [data.aws_security_group.selected.id]
}

resource "aws_route53_record" "my_public_record"{
    zone_id = var.zone_id
    name    = "${var.name}-${var.env}"
    type    = "A"
    ttl     = 300
    records = [aws_instance.my_instance.private_ip]
}

resource "null_resource" "ansible"{
    depends_on = [aws_route53_record.my_public_record]
    provisioner "remote-exec"{
         connection {
            type     = "ssh"
            user     = "ec2-user"
            password = "DevOps321"
            host     = aws_instance.my_instance.private_ip
        }
        inline = [
            "sudo pip3.11 install ansible hvac",
            "ansible-pull -i localhost, -U https://github.com/DevOpsProjectsOrganization/devops_ecommerce_project/tree/2956b2d8b3077929c3aab397bb493ecec4929625/Phase_2_Conf_Mgt_Ansible roboshop.yml -e role=$(var.name)"
        ]
       
    }
}