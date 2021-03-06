pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        }
    triggers {
        cron(env.BRANCH_NAME == 'main' ? 'H 0 * * *' : '')
        pollSCM('*/5 * * * *')
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                bat 'gradlew clean'
                bat 'gradlew build -x test'
            }
        }
        stage('Test') {
            steps {
                bat 'gradlew test'
            }
        }
        stage('Build Docker Image') {

             steps {
                 echo 'Building docker image'
                 bat 'jenkins-build-docker-image-local-windows.cmd'
             }
        }
        stage('Run docker container') {
             steps {
                 bat 'jenkins-spin-up-docker-container-local-windows.cmd'
             }
        }

        stage('Security Test') {
             steps {
                echo 'Run Zap security test'
                bat 'scripts\\zap\\zap-test-using-rest-api.cmd'

             }
        }

    }
	post {
         always {
             echo 'Post jobs started...'
         }
         success {
             echo 'Build successful!'
         }
         failure {
             echo 'Build failed!'
         }
         unstable {
             echo 'Something is unstable...'
         }
         changed {
            echo 'State changed...'
         }
     }
}
