pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
    }

    tools {
        nodejs 'nextjs-jenkins'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/yazilansari/nextjs-jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("nextjs-app")
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    dockerImage.run('-p 3000:3000')
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline complete'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}