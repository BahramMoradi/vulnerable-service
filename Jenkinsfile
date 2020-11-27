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
