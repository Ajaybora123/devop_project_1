pipeline {
  environment {
		AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
		AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
		AWS_DEFAULT_REGION    = 'us-east-1'
	}

  agent {
    docker {
      image 'hashicorp/terraform:1.4.0'
      args "--entrypoint='' -u root -v $HOME/.aws:/root/.aws"
    }
  }
  environment {
    AWS_REGION = 'ap-south-1'
  }
  stages {
    stage('Init')    { steps { sh 'terraform init' } }
    stage('Validate'){ steps { sh 'terraform validate' } }
    stage('Plan')    { steps { sh 'terraform plan -out=tfplan' } }
    stage('Apply')   { steps { sh 'terraform apply -auto-approve tfplan' } }
  }
}
