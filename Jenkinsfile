pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                sh './docker-build.sh'
            }
        }
        stage ('Run') {
            steps {
                sh './docker-run.sh'
            }
        }
        stage ('Test') {
            steps {
                sh './test-is-up.sh'
            }
        }
    }
}