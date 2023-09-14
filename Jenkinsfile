pipeline {
    agent any
    
    environment {
        // Define environment variables
        GIT_REPO = 'https://github.com/G-Agastya/nginx_custom_tools.git'
        DOCKER_REGISTRY = 'https://hub.docker.com/repository/docker/agastya2205/nginx_custom/general'
        DOCKERFILE_PATH = 'nwat.txt'  // Path to your Dockerfile in the Git repository
        DOCKER_IMAGE_NAME = 'nginx.latest'
        DOCKERHUB_TOKEN = credentials('dckr_pat_Z7unqe6WPqko9qmyRuIqFgRtIrc') // Use the ID of your Docker Hub token credential
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your Git repository
                script {
                    git branch: 'master', credentialsId: 'your-git-credentials', url: GIT_REPO
                }
            }
        }
        
        stage('Build and Push Docker Image') {
            steps {
                // Build the Docker image without sudo
                sh 'docker build -t $DOCKER_IMAGE_NAME -f $DOCKERFILE_PATH .'
                
                // Log in to Docker Hub using the access token
                sh "echo $DOCKERHUB_TOKEN | docker login -u $DOCKERHUB_USERNAME --password-stdin $DOCKER_REGISTRY"
                
                // Tag the Docker image for Docker Hub
                sh "docker tag $DOCKER_IMAGE_NAME $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME"
                
                // Push the Docker image to Docker Hub
                sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME"
            }
        }
    }
}
