// pipeline {
//     agent any
//     environment {
//         DOCKER_IMAGE = 'vishakhsingh7/nodejs-app'
//         DOCKER_CREDENTIALS_ID = 'dockerhubcred'
//     }
//     stages {
//         stage('Build Image') {
//             steps {
//                 bat "docker build -t vishakhsingh7/nodejs-app:%BUILD_NUMBER% ."
//             }
//         }
//         stage('Login to DockerHub') {
//             steps {
//                 withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
//                     bat '''
//                         echo %PASSWORD% | docker login -u %USERNAME% --password-stdin
//                     '''
//                 }
//             }
//         }
//         stage('Push Image') {
//             steps {
//                 bat '''
//                     docker tag vishakhsingh7/nodejs-app:%BUILD_NUMBER% vishakhsingh7/nodejs-app:latest
//                     docker push vishakhsingh7/nodejs-app:%BUILD_NUMBER%
//                     docker push vishakhsingh7/nodejs-app:latest
//                 '''
//             }
//         }
//         stage('Cleanup') {
//             steps {
//                 bat '''
//                     docker rmi vishakhsingh7/nodejs-app:%BUILD_NUMBER% || exit 0
//                     docker rmi vishakhsingh7/nodejs-app:latest || exit 0
//                 '''
//             }
//         }
//     }
// }
pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'vishakhsingh7/nodejs-app'
        DOCKER_USERNAME = 'your_dockerhub_username'
        DOCKER_PASSWORD = 'your_dockerhub_password'
    }
    stages {
        stage('Build Image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE%:%BUILD_NUMBER% ."
            }
        }
        stage('Login to DockerHub') {
            steps {
                bat "echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin"
            }
        }
        stage('Push Image') {
            steps {
                bat """
                    docker tag %DOCKER_IMAGE%:%BUILD_NUMBER% %DOCKER_IMAGE%:latest
                    docker push %DOCKER_IMAGE%:%BUILD_NUMBER%
                    docker push %DOCKER_IMAGE%:latest
                """
            }
        }
        stage('Cleanup') {
            steps {
                bat """
                    docker rmi %DOCKER_IMAGE%:%BUILD_NUMBER% || exit 0
                    docker rmi %DOCKER_IMAGE%:latest || exit 0
                """
            }
        }
    }
}

