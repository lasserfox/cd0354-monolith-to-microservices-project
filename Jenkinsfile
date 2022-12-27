// define an environment variable that contains the credential name based on the branch name
def PASSWORD_ENV = env.BRANCH_NAME == 'main' ? 'PROD_PASS' : 'DEV_PASS'
// pipeline {
//         agent any
//         stages {
//             stage('Pre-config') {
//                  environment {
//                      //PASSWORD = credentials("${PASSWORD_ENV}")
//                      PASSWORD = "${PASSWORD_ENV}"
//                  }
//                  steps {
//                      sh 'echo ${PASSWORD_ENV}'
//                  }
//             }
// //             stage ('build-docker'){
// //                 steps {
// //                     sh 'docker build -t udagram-api-feed ./udagram-api-feed '
// //                 }
// //             }
//
//         }
//  }
pipeline {
    agent {
        docker { image 'node:16.13.1-alpine' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}