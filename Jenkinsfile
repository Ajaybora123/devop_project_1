pipeline {
	agent any
	environment {
		SERVER_NAME = "${env.SERVER_NAME}"
		TERRAFORM_ACTION = "${env.TERRAFORM_ACTION}"
	}
	stages {
		stage('Terraform') {
			steps {
				dir('DevOps_Project_2/Terraform') {
					sh '''
						if [ -z "${SERVER_NAME}" ]; then
							echo "Error: SERVER_NAME is not set."
							exit 1
						fi

						if [ -z "${TERRAFORM_ACTION}" ]; then
							echo "Error: TERRAFORM_ACTION is not set."
							exit 1
						fi

						case "$TERRAFORM_ACTION" in
							apply|plan|destroy)
								sed -i "s/server_name/${SERVER_NAME}/g" backend.tf
								export TF_VAR_name=${SERVER_NAME}
								terraform init
								terraform plan
								terraform $TERRAFORM_ACTION -auto-approve
								;;
							*)
								echo "Error: TERRAFORM_ACTION must be one of: apply, destroy, plan."
								exit 1
								;;
						esac
					'''
				}
			}
		}
		stage('Ansible') {
			when {
				expression { env.TERRAFORM_ACTION != 'destroy' }
			}
			steps {
				dir('DevOps_Project_2/Ansible') {
					sh '''
						if [ ! -f /opt/ansible/inventory/aws_ec2.yaml ]; then
							echo "Error: Inventory file /opt/ansible/inventory/aws_ec2.yaml does not exist."
							exit 1
						fi
						if [ ! -f apache.yaml ]; then
							echo "Error: Playbook apache.yaml does not exist in $(pwd)."
							exit 1
						fi
						ansible-playbook -i /opt/ansible/inventory/aws_ec2.yaml apache.yaml
					'''
				}
			}
		}
	}
}