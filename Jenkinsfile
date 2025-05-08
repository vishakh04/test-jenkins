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
                script {
                    // Fetch DockerHub credentials securely from Jenkins
                    def dockerHubCredentials = credentials(DOCKER_CREDENTIALS_ID)
                    def username = dockerHubCredentials.getUsername()
                    def password = dockerHubCredentials.getPassword()

                    // Login to DockerHub
                    bat """
                        echo ${password} | docker login -u ${username} --password-stdin
                    """
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
