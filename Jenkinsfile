pipeline {
agent any
    stages {
        // Validación del software instalado en el servicio
        stage ('Setup') {
            steps  {
                sh "bash pipeline/PIPELINE-FULL-STAGING/1-setup.sh"
            }
        stage ('Test') {
            steps {
                sh "bash pipeline/PIPELINE-FULL-STAGING/2-testing.sh"
            }
        stage ('Build') {
            steps {
                sh "bash pipeline/PIPELINE-FULL-STAGING/3-build.sh"
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