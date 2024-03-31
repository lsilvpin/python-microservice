pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                sh 'sudo bash ./docker-build.sh'
            }
        }
        stage ('Run') {
            steps {
                sh 'sudo bash ./docker-run.sh'
            }
        }
        stage ('Test') {
            steps {
                sh 'sudo bash ./test-is-up.sh'
            }
        }
    }
}