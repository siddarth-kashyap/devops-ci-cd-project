pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Pulling the latest code from Git...'
                // Jenkins automatically pulls the branch configured in the GUI, but this ensures the workspace is prepped
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo 'Cleaning and compiling the code...'
                bat 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                // If tests fail, the pipeline will automatically fail fast here
                bat 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                echo 'Packaging into a WAR file...'
                bat 'mvn package'
            }
        }
        
        stage('Archive') {
            steps {
                echo 'Archiving the artifact...'
                // This saves the WAR file in Jenkins so you can download it later or use it for rollbacks
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying to local Tomcat...'
                // IMPORTANT: Replace the path below with your actual Tomcat webapps folder path!
                bat 'copy target\\student-feedback-portal.war "C:\\apache-tomcat-10.1.57-windows-x64\\apache-tomcat-10.1.57\\webapps\\"'
            }
        }
        
        stage('Verify') {
            steps {
                echo 'Running Health Check...'
                // Pings the health endpoint we created. The -f flag makes curl fail if it doesn't get a 200 OK.
                // Adjust the port if your Tomcat is running on 8081 instead of 8080.
                bat 'curl -f http://localhost:8080/student-feedback-portal/health'
            }
        }
    }
}