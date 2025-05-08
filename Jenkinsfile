pipeline {
    agent any 
    environment{
        DOCKER_IMAGE = 'vishakhsingh7/nodejs-app'
        
        DOCKER_CREDENTIALS_ID = 'dockerhubcred'
    }
    stages{
        
        stage('Build docker image'){
            steps{
                script{
                    dockerImage=docker.build("${DOCKER_IMAGE}:${}")
                }
            }
        }
        stage('Push docker image'){
            steps{
                script{
                    docker.withRegistry('https://index.docker.io/v1/',DOCKER_CREDENTIALS_ID){
                        dockerImage.push()
                        dockerImage.push('latest')
                    }       
            }
        }
        }
        stage('cleanup local images '){
            steps{
                sh "docker rmi ${DOCKER_IMAGE}:${BUILD_NUMBER}||true"
                sh "docker rmi ${DOCKER_IMAGE}:latest||true"
            }
        }
    }
}
post{
    success{
        echo 'Build and push to docker hub completed successfully'
    }
    failure{
        echo 'Build and push to docker hub failed'
    }
}