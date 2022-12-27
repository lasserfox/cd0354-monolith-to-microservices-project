// define an environment variable that contains the credential name based on the branch name
def PASSWORD_ENV = env.BRANCH_NAME == 'main' ? 'PROD_PASS' : 'DEV_PASS'
pipeline {
        agent any
        stages {
            stage('Pre-config') {
                 environment {
                     //PASSWORD = credentials("${PASSWORD_ENV}")
                     PASSWORD = "${PASSWORD_ENV}"
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
                sh 'docker build -t udagram-api-feed ./udagram-api-feed'
            }}
        }
 }