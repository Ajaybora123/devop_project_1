pipeline {
    agent any

    environment {
	    

        TF_IMAGE = 'hashicorp/terraform:1.5.7'
        TF_DIR = 'main' // folder with .tf files
	    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
		AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
		AWS_DEFAULT_REGION    = 'us-east-1'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-org/your-repo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                              docker.image('hashicorp/terraform:1.5.7').inside('--entrypoint=\'\'') {
 {
                        sh """
                            cd /workspace/${TF_DIR}
                            terraform init
                        """
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                               docker.image('hashicorp/terraform:1.5.7').inside('--entrypoint=\'\'') {
 {
                        sh """
                            cd /workspace/${TF_DIR}
                            terraform plan
                        """
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { return params.APPLY_TF == true }
            }
            steps {
                script {
                           docker.image('hashicorp/terraform:1.5.7').inside('--entrypoint=\'\'') {
 {
                        sh """
                            cd /workspace/${TF_DIR}
                            terraform apply -auto-approve
                        """
                    }
                }
            }
        }
    }

    parameters {
        booleanParam(name: 'APPLY_TF', defaultValue: false, description: 'Apply Terraform changes?')
    }

}





