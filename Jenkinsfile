

pipeline {
  agent {
    docker {
      image 'node:16.16.0'
      args '-p 3000:3000'
    }

  }
  stages {    
        stage('Install') {
          steps {
            sh 'npm install '
            //sh 'npm cache clean -f '
           // sh 'npm install -g n '
          }
        }
     stage ('test'){
      steps{
        sh 'npm run test'
      }
      /*post {
          always {
            junit "test-results.xml"
          }
      }*/
    }

      }
  
}
