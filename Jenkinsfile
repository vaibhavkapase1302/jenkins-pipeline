pipeline {
    agent any
    
    parameters {
        string(name: 'GIT_BRANCH', defaultValue: 'main', description: 'Git branch to clone')
        string(name: 'IMAGE_TAG', defaultValue: 'latest', description: 'Docker image tag')
    }

    stages { 
        stage("Cleanup Workspace") {
            steps {
                cleanWs()
            }
        }

        stage("Clone the Code") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'gitHub', passwordVariable: 'githubPass', usernameVariable: 'githubUser')]) {
                    bat "git clone https://github.com/vaibhavkapase1302/jenkins-pipeline.git -b ${params.GIT_BRANCH}"
                }
            }
        }

        stage("Build") {
            steps {
                dir('jenkins-pipeline') {
                    bat "docker build -t new-flask-app-v2:${params.IMAGE_TAG} ."
                }
            }
        }

        stage("Push to Docker Hub") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: "dockerHubPass", usernameVariable: 'dockerHubUser')]) {
                    bat "docker tag new-flask-app-v2:${params.IMAGE_TAG} ${env.dockerHubUser}/new-flask-app-v2:${params.IMAGE_TAG}"
                    bat "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    bat "docker push ${env.dockerHubUser}/new-flask-app-v2:${params.IMAGE_TAG}"
                }
            }
        }

        stage("Deploy") {
            steps {
                helloWorld()            }
        }
    }
}
