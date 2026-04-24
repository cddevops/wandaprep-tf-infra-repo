def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
    ]

pipeline {
    agent any
    
    tools {
        terraform 'Terraform'
    }
    
    environment {
        AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Cloning codebase from GITHUB to Jenkins '
                git branch: 'main', credentialsId: 'git-creds', url: 'https://github.com/cddevops/wandaprep-tf-infra-repo.git'
                sh 'ls'
            }
        }
        
        stage('Terraform init') {
            steps {
                echo 'INITIALISE terraform'
                sh 'terraform init'
                sh 'ls'
            }
        }
        
        stage('Terraform plan') {
            steps {
                echo 'PLAN terraform'
                sh 'terraform plan'
                sh 'ls'
            }
        }
        
        stage('Terraform Apply/Destroy') {
            steps {
                echo 'APPLY terraform'
                sh 'terraform ${action} --auto-approve'
                sh 'ls'
            }
        }
    }
    
    post { 
        always { 
            echo 'Sending build result'
            slackSend channel: '#all-slack-help365', color: COLOR_MAP[currentBuild.currentResult], message: "Build Started - ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)"
        }
    }
}
