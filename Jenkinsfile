pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'vishakhsingh7/nodejs-app'
        DOCKER_CREDENTIALS_ID = 'dockerhubcred'
    }
    stages {
        stage('Build Image') {
            steps {
                bat "docker build -t vishakhsingh7/nodejs-app:%BUILD_NUMBER% ."
            }
        }
        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    bat '''
                        echo %PASSWORD% | docker login -u %USERNAME% --password-stdin
                    '''
                }
            }
        }
        stage('Push Image') {
            steps {
                bat '''
                    docker tag vishakhsingh7/nodejs-app:%BUILD_NUMBER% vishakhsingh7/nodejs-app:latest
                    docker push vishakhsingh7/nodejs-app:%BUILD_NUMBER%
                    docker push vishakhsingh7/nodejs-app:latest
                '''
            }
        }
        stage('Cleanup') {
            steps {
                bat '''
                    docker rmi vishakhsingh7/nodejs-app:%BUILD_NUMBER% || exit 0
                    docker rmi vishakhsingh7/nodejs-app:latest || exit 0
                '''
            }
        }
    }
}
