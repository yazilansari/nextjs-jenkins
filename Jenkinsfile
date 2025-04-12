// pipeline {
//     agent any

//     environment {
//         NODE_ENV = 'production'
//     }

//     tools {
//         nodejs 'nextjs-jenkins' // Make sure NodeJS is installed in Jenkins global tools config
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 git 'https://github.com/yazilansari/nextjs-jenkins.git'
//             }
//         }

//         stage('Install Dependencies') {
//             steps {
//                 sh 'npm install'
//             }
//         }

//         stage('Build') {
//             steps {
//                 sh 'npm run build'
//             }
//         }

//         // stage('Test') {
//         //     steps {
//         //         sh 'npm test'
//         //     }
//         // }

//         // Optional: Linting
//         // stage('Lint') {
//         //     steps {
//         //         sh 'npm run lint'
//         //     }
//         // }

//         // Optional: Deployment
//         // stage('Deploy') {
//         //     when {
//         //         branch 'main'
//         //     }
//         //     steps {
//         //         // Replace with your deployment logic
//         //         sh 'npm run deploy'
//         //     }
//         // }
//     }

//     post {
//         always {
//             echo 'Pipeline complete'
//         }
//         failure {
//             echo 'Pipeline failed!'
//         }
//     }
// }

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