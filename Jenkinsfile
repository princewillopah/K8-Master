properties([
    parameters([
        string(
            defaultValue: 'dev',
            name: 'Environment'
        ),
        choice(
            choices: ['plan', 'apply', 'destroy'], 
            name: 'Terraform_Action'
        )])
])
pipeline {
    agent any
    stages {
        stage('Preparing') {
            steps {
                sh 'echo Preparing'
            }
        }
        stage('Git Pulling') {
            steps {
                git branch: 'master', url: 'https://github.com/princewillopah/K8-Master.git'
            }
        }
        stage('Init') {
            steps {
                withAWS(credentials: 'aws-cred', region: 'eu-north-1') {
                sh 'terraform -chdir=EKS_Terraform-2/ init'
                }
            }
        }
        stage('Validate') {
            steps {
                withAWS(credentials: 'aws-cred', region: 'eu-north-1') {
                sh 'terraform -chdir=EKS_Terraform-2/ validate'
                }
            }
        }
        stage('Action') {
            steps {
                withAWS(credentials: 'aws-cred', region: 'eu-north-1') {
                    script {    
                        if (params.Terraform_Action == 'plan') {
                            sh "terraform -chdir=EKS_Terraform-2/ plan -var-file=${params.Environment}.tfvars"
                        }   else if (params.Terraform_Action == 'apply') {
                            sh "terraform -chdir=EKS_Terraform-2/ apply -var-file=${params.Environment}.tfvars -auto-approve"
                        }   else if (params.Terraform_Action == 'destroy') {
                            sh "terraform -chdir=EKS_Terraform-2/ destroy -var-file=${params.Environment}.tfvars -auto-approve"
                        } else {
                            error "Invalid value for Terraform_Action: ${params.Terraform_Action}"
                        }
                    }
                }
            }
        }
    }
}
