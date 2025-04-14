pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
    }

    tools {
        nodejs 'nextjs-jenkins' // Make sure NodeJS is installed in Jenkins global tools config
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //         git 'https://github.com/yazilansari/nextjs-jenkins.git'
        //     }
        // }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
                // sh 'npm install pm2 -g' // Install PM2 globally
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }
        
        stage('Start with PM2') {
            steps {
                // Ensure you have a suitable start script in package.json (e.g., "start": "next start")
                // sh 'pm2 delete nextjs-app || true' // Delete existing process if exists
                // sh 'pm2 start npm --name "nextjs-app" -- run start' // Run Next.js with PM2
                sh 'bash /usr/local/bin/run-app.sh'
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

// pipeline {
//     agent any

//     environment {
//         NODE_ENV = 'production'
//     }

//     tools {
//         nodejs 'nextjs-jenkins' // Make sure this is configured in Jenkins Tools
//     }

//     stages {
//         stage('Checkout Code') {
//             steps {
//                 git 'https://github.com/yazilansari/nextjs-jenkins.git'
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     dockerImage = docker.build("nextjs-app")
//                 }
//             }
//         }

//         stage('Run Next.js Container') {
//             steps {
//                 script {
//                     // Clean up old container if exists
//                     sh 'docker rm -f nextjs-container || true'

//                     // Run the new container on port 3000
//                     dockerImage.run("-d -p 3000:3000 --name nextjs-container")
//                 }
//             }
//         }
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