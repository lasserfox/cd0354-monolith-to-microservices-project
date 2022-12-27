// define an environment variable that contains the credential name based on the branch name
def PASSWORD_ENV = env.BRANCH_NAME == 'master' ? 'PROD_PASSWORD' : 'DEV_PASSWORD'
pipeline {
        agent any
        stages {
            stage('Pre-config') {
                 environment {
                     PASSWORD = credentials("${PASSWORD_ENV}")
                 }
                 steps {
                     sh 'echo ${PASSWORD_ENV}'
                 }
            }
            stage ('build-docker'){
//             agent {
//                 docker {
//                     image 'gradle:6.7-jdk11'
//                     // Run the container on the node specified at the
//                     // top-level of the Pipeline, in the same workspace,
//                     // rather than on a new node entirely:
//                     reuseNode true
//                 }
//             }
            steps {
                sh 'gradle --version'
                sh 'echo ${PASSWORD_ENV}'
            }}
        }
 }