```groovy
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
                sh 'docker compose up -d'

                sh 'docker compose ps'

                sh 'sleep 10'

                sh 'curl -f http://localhost:5000'
            }
        }

        stage('Approval') {
            steps {
                input(
                    message: 'Test successful. Do you want to continue?',
                    ok: 'Yes'
                )
            }
        }

        stage('Deploy') {
            steps {
                echo 'Production deployment approved'
                sh 'docker compose up -d'
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
```
