pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
                 sh 'terraform --version'
            }
        }
   stage('Terraform Apply') {
            steps {
                echo "Applying Terraform configuration"
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Terraform Destroy') {
            steps {
                input message: 'Do you want to destroy the infrastructure?', ok: 'Destroy'
                echo "Destroying Terraform-managed infrastructure"
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}




