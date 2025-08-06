pipeline {
  agent any
  stages {
    stage('Terraform') {
      agent {
        docker {
          label 'docker-agent'
          image 'hashicorp/terraform:latest'
          args '--entrypoint=/bin/sh'
        }
      }
      environment {
        TF_WORKING_DIR = 'devop_project_1'
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION = 'us-east-1'
      }
      steps {
        dir("${TF_WORKING_DIR}") {
          sh 'terraform init'
          sh 'terraform plan -out=tfplan'
          input message: 'Approve Terraform Apply?', ok: 'Apply'
          sh 'terraform apply -auto-approve tfplan'
        }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
