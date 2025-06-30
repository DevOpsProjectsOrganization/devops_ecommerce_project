default:
	git pull
	ansible-playbook -i $(role)-dev.sdevops.shop -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e role=$(role)