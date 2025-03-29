pipeline{
    agent any
    tools {nodejs "nextjs-jenkins"}
    stages{
        stage("Build"){
            steps{
                nodejs("nextjs-jenkins") {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage("Start"){
            steps{
                nodejs("nextjs-jenkins") {
                    sh 'npm start'
                }
                echo "App started successfully"
            }
        }
    }
}