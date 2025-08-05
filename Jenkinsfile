pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }
stage('Install Terraform') {
  steps {
    sh """
      wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
      unzip terraform_1.6.6_linux_amd64.zip
      chmod +x terraform && sudo mv terraform /usr/local/bin/
      terraform version
    """
  }
}

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
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


