pipeline {
agent any

```
stages {

    stage('Build') {
        steps {
            sh 'docker compose -f compose.test.yaml build'
        }
    }

    stage('Test') {
        steps {
            sh 'docker compose -f compose.test.yaml up -d'

            sh 'docker compose -f compose.test.yaml ps'

            sh 'curl -f http://localhost:8081'
        }
    }

    stage('Approval') {
        steps {
            input(
                message: 'Test successful. Deploy to Production?',
                ok: 'YES'
            )
        }
    }

    stage('Production') {
        steps {
            sh 'docker compose -f compose.prod.yaml up -d'

            sh 'docker compose -f compose.prod.yaml ps'
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
```

}
