pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'vishakhsingh7/nodejs-app'
        DOCKER_CREDENTIALS_ID = 'dockerhubcred'
    }
    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t vishakhsingh7/nodejs-app:${BUILD_NUMBER} .'
            }
        }
        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                }
            }
        }
        stage('Push Image') {
            steps {
                sh '''
                    docker tag vishakhsingh7/nodejs-app:${BUILD_NUMBER} vishakhsingh7/nodejs-app:latest
                    docker push vishakhsingh7/nodejs-app:${BUILD_NUMBER}
                    docker push vishakhsingh7/nodejs-app:latest
                '''
            }
        }
        stage('Cleanup') {
            steps {
                sh '''
                    docker rmi vishakhsingh7/nodejs-app:${BUILD_NUMBER} || true
                    docker rmi vishakhsingh7/nodejs-app:latest || true
                '''
            }
        }
    }
}
