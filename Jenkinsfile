pipeline {
  agent {
    docker {
      image 'hashicorp/terraform:latest'
      // override default entrypoint so sh steps work
      args '--entrypoint=/bin/sh'
    }
  }
  environment {
    TF_WORKING_DIR = 'devop_project_1'  
	  AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }// your Terraform config directory
  }
  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://your-repo.git'
      }
    }
    stage('Terraform Init') {
      steps {
        sh """
          cd ${TF_WORKING_DIR}
          terraform init
        """
      }
    }
    stage('Terraform Plan') {
      steps {
        sh """
          cd ${TF_WORKING_DIR}
          terraform plan -out=tfplan
        """
      }
    }
    stage('Review / Approval') {
      steps {
        input message: "Approve Terraform apply?", ok: "Apply"
      }
    }
    stage('Terraform Apply') {
      steps {
        sh """
          cd ${TF_WORKING_DIR}
          terraform apply -auto-approve tfplan
        """
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
