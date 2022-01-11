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
    			git branch: 'main', url: 'https://github.com/ngthanhdatt/War-in-DockerTomcat.git'
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
                /* ids=$(docker ps -a -q)
                    for id in $ids
                    do
                        echo "$id"
                        docker stop $id && docker rm $id
                    done
                */
        		sh 'docker run -it -dp 8082:8080 ngthanhdat/loginapptomcat:latest'
        	}
        }
     }
}
