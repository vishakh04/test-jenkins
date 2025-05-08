pipeline {
    agent any 
    environment {
        DOCKER_IMAGE = 'vishakhsingh7/nodejs-app'
        DOCKER_CREDENTIALS_ID = 'dockerhubcred'
    }
    stages {
        stage('Build docker image') {
            steps {
                script {
                    def dockerImage = docker.build("${DOCKER_IMAGE}:${BUILD_NUMBER}")
                    // Store for later use
                    env.IMAGE_TAG = "${DOCKER_IMAGE}:${BUILD_NUMBER}"
                }
            }
        }
        stage('Push docker image') {
            steps {
                script {
                    def dockerImage = docker.image("${DOCKER_IMAGE}:${BUILD_NUMBER}")
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Cleanup local images') {
            steps {
                sh "docker rmi ${DOCKER_IMAGE}:${BUILD_NUMBER} || true"
                sh "docker rmi ${DOCKER_IMAGE}:latest || true"
            }
        }
    }
    post {
        success {
            echo 'Build and push to Docker Hub completed successfully'
        }
        failure {
            echo 'Build and push to Docker Hub failed'
        }
    }
}
