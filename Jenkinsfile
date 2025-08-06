pipeline {
    agent {
        docker {
            image 'terraform-jenkins:latest'
        }
    }
environment {
		AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
		AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
		AWS_DEFAULT_REGION    = 'us-east-1'
	}

    stages {
        stage('Clone Terraform Code') {
            steps {
                git 'https://github.com/your-org/your-terraform-repo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input 'Apply Terraform Changes?'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
