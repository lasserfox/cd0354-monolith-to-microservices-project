// define an environment variable that contains the credential name based on the branch name
def PASSWORD_ENV = env.BRANCH_NAME == 'master' ? 'PROD_PASSWORD' : 'DEV_PASSWORD'
pipeline {
        agent {
            node {
                label "master"  //change this as per your agent label
            }
        }
     stages {
         stage('Deploy') {
             environment {
                 PASSWORD = credentials("${PASSWORD_ENV}")
             }
             steps {
                 sh 'echo ${PASSWORD}'
             }
          }
     }
 }