pipeline {
agent any
    stages {
        // Validación del software instalado en el servicio
        stage('Validate software'){
            steps {
                sh 'history'
                sh 'node --version'
                sh 'npm --version'
                sh 'python --version'
            }
        }
        stage ('Setup') {
            steps  {
                sh "bash pipeline/PIPELINE-FULL-STAGING/1-setup.sh"
            }
        }
        stage ('Test') {
            steps {
                sh "bash pipeline/PIPELINE-FULL-STAGING/2-testing.sh"
            }
        }
        stage ('Build') {
            steps {
                sh "bash pipeline/PIPELINE-FULL-STAGING/3-build.sh"
            }
        }
        stage ('Clean up') {
            steps {
                deleteDir()
            }
        }
    }
    post {
        always {
            sh "docker stop `docker ps -q`"
            sh "docker system prune -af --volumes"
        }
        failure {
            echo 'Malas Noticias!'
        }
    }
 }