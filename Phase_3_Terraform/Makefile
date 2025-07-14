dev-init:
	rm -rf ./environments/dev/terraform.terraform
	terraform init
dev-plan:
	terraform init
	terraform plan -var-file=./environments/dev/main.tfvars
dev-apply:
	terraform init
	terraform apply -auto-approve -var-file=./environments/dev/main.tfvars
dev-destroy:
	terraform init
	terraform destroy -auto-approve -var-file=./environments/dev/main.tfvars

prod-init:
	rm -rf ./environments/prod/terraform.terraform
	terraform init
prod-plan:
	terraform init
	terraform plan -var-file=./environments/prod/main.tfvars
prod-apply:
	terraform init
	terraform apply -auto-approve -var-file=./environments/prod/main.tfvars
prod-destroy:
	terraform init
	terraform destroy -auto-approve -var-file=./environments/prod/main.tfvars