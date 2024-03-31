pipeline {
    agent any
    stages {
        stage ('Build') {
            steps {
                bash ./docker-build.sh
            }
        }
        stage ('Run') {
            steps {
                bash ./docker-run.sh
            }
        }
        stage ('Test') {
            steps {
                bash ./test-is-up.sh
            }
        }
    }
}