
pipeline {
    agent any

    tools {
         terraform 'Terraform'
     }

    environment {
        //Credentials for Prod environment
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID') 
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('Git checkout from prod branch') {
            steps {
                echo 'Cloning project codebase...'
                git branch: 'main', url: 'https://github.com/devopsmike-01/jenkins-terraform-infra-repo.git'
                sh 'ls'
            }
        }

        stage('Verifying AWS Configuration'){
            steps {
                sh 'aws s3 ls'
            }
        }

         stage('Verify Terraform Version') {
            steps {
                echo 'verifying the terrform version...'
                sh 'terraform --version'
               
            }
        }
        
        stage('Terraform init') {
            steps {
                echo 'Initiliazing terraform project...'
                sh 'terraform init'
               
            }
        }
        
        stage('Terraform validate') {
            steps {
                echo 'Code syntax checking...'
                sh 'terraform validate'
                sh 'pwd'
            }
        }
        
        stage('Terraform plan') {
            steps {
                echo 'Terraform plan for the dry run...'
                sh 'terraform plan --auto-approve"'
               
            }
        }
        
        stage('Manual approval to Create') {
            steps {
                
                input 'Approval required to create resources'
               
            }
        }
        
        stage('Terraform apply') {
            steps {
                echo 'Terraform apply...'
                sh 'terraform apply --auto-approve'
            } 
        }

        stage('Manual approval to Delete') {
            steps {
                
                input 'Approval required to clean environment'
               
            }
        }
        
        stage('Terraform Destroy') {
            steps {
                echo 'Terraform Destroy...'
                sh 'terraform destroy --auto-approve'
                }
            }
    }

}
