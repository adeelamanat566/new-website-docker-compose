pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'docker compose build'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }

        stage('Check') {
            steps {
                sh 'docker compose ps'
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
