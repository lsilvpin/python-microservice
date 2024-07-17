pipeline {
    agent any
    stages {
        stage ('Docker build') {
            steps {
                sh 'bash ./docker-build.sh'
            }
        }
        stage ('Docker test') {
            steps {
                sh 'bash ./docker-test.sh'
            }
        }
        stage ('Docker deploy') {
            steps {
                sh 'bash ./docker-deploy.sh'
            }
        }
        stage ('Health check') {
            steps {
                sh 'bash ./test-is-up.sh'
            }
        }
    }
}