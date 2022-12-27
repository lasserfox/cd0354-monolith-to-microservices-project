// define an environment variable that contains the credential name based on the branch name
def PASSWORD_ENV = env.BRANCH_NAME == 'main' ? 'PROD_PASS' : 'DEV_PASS'
pipeline {
        agent any
        stages {
            stage('Pre-config') {
                 environment {
                     PASSWORD = "${PASSWORD_ENV}"
                 }
                 steps {
                     sh 'echo ${PASSWORD_ENV}'
                 }
            }
            stage('Build') {
                agent {
                    docker {
                        image 'lasserfox/udagram-api-user:latest'
                        reuseNode true
                    }
                }
                steps {
                    sh 'npm run prod'
                }
            }

        }
 }
