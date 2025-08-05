pipeline {
	agent any

	parameters {
		string(name: 'REF', defaultValue: 'main', description: 'Reference for Terraform Apply/Destroy (e.g., branch, tag, environment)')
	}

	environment {
		AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
		AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
		AWS_DEFAULT_REGION    = 'us-east-1'
	}

	stages {
		stage('Terraform Init') {
			steps {
				sh 'terraform init'
			}
		}
		stage('Terraform Apply') {
			steps {
				echo "Applying with reference: ${params.REF}"
				// Use REF as needed, for example, to checkout a branch or pass as a variable
				sh "terraform apply -auto-approve -var='ref=${params.REF}'"
			}
		}
		stage('Terraform Destroy') {
			steps {
				input message: 'Do you want to destroy the infrastructure?', ok: 'Destroy'
				echo "Destroying with reference: ${params.REF}"
				sh "terraform destroy -auto-approve -var='ref=${params.REF}'"
			}
		}
	}
}
