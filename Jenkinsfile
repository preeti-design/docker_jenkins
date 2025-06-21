pipeline {
    agent any

    environment {
        IMAGE_NAME = "preeti221/myimage1"
        TAG = "redgrapes"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/preeti-design/docker_jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t  $IMAGE_NAME:$TAG .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub_creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }

        stage('Clean Up') {
            steps {
                sh 'docker rmi $IMAGE_NAME:$TAG || true'
            }
        }
    }

    post {
        success {
            echo 'Static HTML Docker image built and pushed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
