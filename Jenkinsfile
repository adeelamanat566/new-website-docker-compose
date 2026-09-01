pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                sh 'docker compose config'
                sh 'docker compose build  '
                }
            }
        stage(test){
            steps {
                input(
                    message: 'do you wantcontinues?',
                    ok: 'yes we should'
                    )
                }
            }
        stage(deploy){
            steps {
                sh 'docker compose up -d'
                }
            }
        }
    }
    post{
        always{
            echo 'finised oipli'
            
        }
        success{
            echo 'success'
        }
        failure{
            echo 'failure'
        }




    

}

