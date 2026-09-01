
pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'docker compose config'
                sh 'docker compose build'
            }
        }

        stage('Test') {
            steps {
                input(
                    message: 'Do you want to continue?',
                    ok: 'Yes'
                )
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }

    post {

        always {
            echo 'Finished pipeline'
        }

        success {
            echo 'Success'
        }

        failure {
            echo 'Failure'
        }
    }
}

