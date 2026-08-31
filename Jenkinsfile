pipeline {
    agent any

    stages {
        stage('Checkout Test') {
            steps {
                echo 'GitHub code successfully checked out'
                sh 'pwd'
                sh 'ls -la'
            }
        }

        stage('Docker Check') {
            steps {
                sh 'docker --version'
                sh 'docker compose version'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished'
        }

        success {
            echo 'Pipeline successful'
        }

        failure {
            echo 'Pipeline failed'
        }
    }
}
