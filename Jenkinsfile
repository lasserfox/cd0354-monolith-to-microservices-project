// define an environment variable that contains the credential name based on the branch name
def PASSWORD_ENV = env.BRANCH_NAME == 'main' ? 'PROD_PASS' : 'DEV_PASS'
def BUILD_ID = env.BUILD_ID
pipeline {
        agent any
        stages {
            stage('Pre-config') {
                 environment {
                     PASSWORD = "${PASSWORD_ENV}"
                     RUN_ID = "${BUILD_ID}"
                 }
                 steps {
                     sh 'echo BUILD: ${RUN_ID}'
                     sh 'echo `hostname`'
                 }
            }
             stage('Build test and push udagram-api-feed') {
                 agent {
                     docker {
                         image 'lasserfox/udagram-api-feed:latest'
                         reuseNode true
                     }
                 }
                 steps {
                     sh 'echo udagram-api-feed: ${RUN_ID}'
                     sh 'echo `hostname`'
                 }
             }
            stage('Build test and push udagram-api-user') {
                agent {
                    docker {
                        image 'lasserfox/udagram-api-user:latest'
                        reuseNode true
                    }
                }
                steps {
                     sh 'echo udagram-api-user: ${RUN_ID}'
                     sh 'echo `hostname`'
                 }
            }
            stage('Build test and push udagram-frontend') {
                agent {
                    docker {
                        image 'lasserfox/udagram-frontend:latest'
                        reuseNode true
                    }
                }
                steps {
                     sh 'echo udagram-frontend: ${RUN_ID}'
                     sh 'echo `hostname`'
                 }
            }
            stage('Build test and push reverse-proxy') {
                agent {
                    docker {
                        image 'lasserfox/reverseproxy:latest'
                        reuseNode true
                    }
                }
                steps {
                     sh 'echo reverseproxy: ${RUN_ID}'
                     sh 'echo `hostname`'
                 }
            }

        }
 }
