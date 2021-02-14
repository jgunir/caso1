pipeline {
agent any
    stages {
        // Validación del software instalado en el servicio
        stage ('Setup') {
            steps  {
                sh "bash pipeline/PIPELINE-TEST/1-setup.sh"
            }
        }
        stage ('Test') {
            steps {
                sh "bash pipeline/PIPELINE-TEST/2-testing.sh"
            }
        }
        stage ('Clean') {
            steps {
                sh 'bash pipeline/PIPELINE-TEST/3-clean.sh'
            }
        }
    }
    post {
        always {
             echo 'Parece que todo fue ok!'
        }
        failure {
            echo 'Malas Noticias!'
        }
    }
 }