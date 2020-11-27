pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        }
    triggers {
        cron(env.BRANCH_NAME == 'main' ? 'H 0 * * *' : '')
        pollSCM('*/5 * * * *')
    }
    tools {
        gradle "Gradle 6.7.1"
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                bat 'gradlew.bat clean'
                bat 'gradlew.bat build -x test'
            }
        }
        stage('Test') {
            steps {
                bat 'gradlew.bat test'
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
