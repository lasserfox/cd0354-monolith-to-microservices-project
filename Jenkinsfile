// define an environment variable that contains the credential name based on the branch name
def PASSWORD_ENV = env.BRANCH_NAME == 'main' ? 'PROD_PASS' : 'DEV_PASS'
def BUILD_ID = env.BUILD_ID
pipeline {
        agent any
        node {
           checkout scm
            /*
             * In order to communicate with the MySQL server, this Pipeline explicitly
             * maps the port (`3306`) to a known port on the host machine.
             */
            docker.image('mysql:5').withRun('-e "MYSQL_ROOT_PASSWORD=my-secret-pw"' +
                                            ' -p 3306:3306') { c ->
                /* Wait until mysql service is up */
                sh 'while ! mysqladmin ping -h0.0.0.0 --silent; do sleep 1; done'
                /* Run some tests which require MySQL */
                sh 'make check'
            }
        }
        stages {
            stage('Pre-config') {
                 environment {
                     PASSWORD = "${PASSWORD_ENV}"
                     RUN_ID = "${BUILD_ID}"
                 }
                 steps {
                     sh 'echo BUILD: ${RUN_ID}'
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
                     sh 'echo tesudagram-api-feed: ${RUN_ID}'
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
                     sh 'echo BUILD: ${RUN_ID}'
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
                     sh 'echo BUILD: ${RUN_ID}'
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
                     sh 'echo BUILD: ${RUN_ID}'
                 }
            }

        }
 }
