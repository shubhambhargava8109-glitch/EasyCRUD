pipeline {
    agent any

    stages {
        stage('Git-Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/shubhambhargava8109-glitch/EasyCRUD.git'
            }
        }
        stage('Init') {
            steps {
sh 'terraform init'
            }
        }
       stage('plan') {
            steps {
sh 'terraform plan'
            }
        }
       stage('approval') {
            steps {
timeout(5) {
                input message : 'All Good ? shall we proceed ? , ok : "approve"'

                }
            }
        }
       stage('Apply') {
            steps {
sh 'terraform apply --auto-approve'
            }
        }

    }
}
