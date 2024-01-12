pipeline {
    agent any
    
    stages { 
        stage("Clone the Code") {
            steps {
                // Define the credentials for Git
                withCredentials([usernamePassword(credentialsId: 'gitHub', passwordVariable: 'githubPass', usernameVariable: 'githubUser')]) {
                    bat "git clone https://github.com/vaibhavkapase1302/jenkins-pipeline.git -b main"
                }
            }
        }

        stage("Build") {
            steps { 
                bat "docker build -t new-flask-app-v2 ."
            }
        }

        stage("Push to Docker Hub") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: "dockerHubPass", usernameVariable: 'dockerHubUser')]) {
                    bat "docker tag new-flask-app-v2 ${env.dockerHubUser}/new-flask-app-v2:latest"
                    bat "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    bat "docker push ${env.dockerHubUser}/new-flask-app-v2:latest"
                }
            }
        }

        stage("Deploy") {
            steps {
                echo "Deploying the Container"
            }
        }
    }
}
