init:
	cd terraform && init

plan:
	terraform -chdir=terraform plan

apply:
	terraform -chdir=terraform apply
