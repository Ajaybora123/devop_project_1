pipeline {
  agent any
  tools { terraform 'terraform' }
  environment {
    PATH = "${tool('terraform')}:$PATH"
  }
  stages {
    stage('Terraform Init') {
      steps {
        sh 'terraform --version'
        sh 'terraform init'
      }
    }
    // subsequent stages
  }
}
