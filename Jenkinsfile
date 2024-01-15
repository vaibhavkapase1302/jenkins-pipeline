pipeline {
    agent any
    
    stages { 
        // Stage 0: Cleanup Workspace
        stage("Cleanup Workspace") {
            steps {
                // Remove existing workspace
                cleanWs()
            }
        }

        // Stage 1: Clone the Code
        stage("Clone the Code") {
            steps {
                // Define the credentials for Git
                withCredentials([usernamePassword(credentialsId: 'gitHub', passwordVariable: 'githubPass', usernameVariable: 'githubUser')]) {
                    // Use Git to clone the repository from GitHub
                    bat "git clone https://github.com/vaibhavkapase1302/jenkins-pipeline.git -b main"
                }
            }
        }

        // Stage 2: Build
        stage("Build") {
            steps { 
                // Build a Docker image with a specified tag and adjust build context
                bat "docker build -t new-flask-app-v2:version-v2 ."
            }
        }

        // Stage 3: Push to Docker Hub
        stage("Push to Docker Hub") {
            steps {
                // Define the credentials for Docker Hub
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: "dockerHubPass", usernameVariable: 'dockerHubUser')]) {
                    // Tag the Docker image with the Docker Hub repository information
                    bat "docker tag new-flask-app-v2 ${env.dockerHubUser}/new-flask-app-v2:version-v2"
                    
                    // Log in to Docker Hub using the provided credentials
                    bat "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    
                    // Push the Docker image to Docker Hub
                    bat "docker push ${env.dockerHubUser}/new-flask-app-v2:version-v2"
                }
            }
        }

        // Stage 4: Deploy
        stage("Deploy") {
            steps {
                // Print a message indicating that the container is being deployed
                echo "Deploying the Container"
            }
        }
    }
}
