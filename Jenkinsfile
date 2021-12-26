pipeline {
    agent any
    tools {
        maven "maven-3"
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('ngthanhdat-dockerhub')
    }
    stages {
    	stage('SCM checkout'){
    		steps{
    			git branch: 'main', credentialsId: 'bb6853db-1e2f-4240-94e8-d68945d47968', url: 'https://github.com/ngthanhdatt/War-in-DockerTomcat.git'
    		}
    	}
        stage('Build'){
            steps{
           		sh 'mvn clean package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t loginapptomcat:latest .'
                sh 'docker tag loginapptomcat ngthanhdat/loginapptomcat:latest'
                sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                sh 'docker push ngthanhdat/loginapptomcat:latest'
            }
        }
        stage('Release') {
        	steps {
        		sh 'docker run -it -dp 8082:8080 ngthanhdat/loginapptomcat:latest'
        	}
        }
     }
}
