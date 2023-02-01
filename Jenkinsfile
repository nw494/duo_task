pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t nwalker494/duotaskimage:latest -t nwalker494/duotaskimage:build-$BUILD_NUMBER .
                '''
            }
        }

        stage('push') {
            steps {
                sh '''
                docker push nwalker494/duotaskimage:latest
                docker push nwalker494/duotaskimage:build-$BUILD_NUMBER
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                ssh -i "~/.ssh/id_rsa" jenkins@35.246.75.29 << EOF
                docker stop duotaskimage
                docker rm duotaskimage
                docker rmi nwalker494/duotaskimage:latest
                docker run -d -p 80:5500 --name duotaskimage nwalker494/duotaskimage:latest
                '''
            }
        }
    }
}