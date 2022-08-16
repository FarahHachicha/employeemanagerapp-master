pipeline {
  agent{
    docker {
      image 'node:16.16.0'
      args '-p 3000:3000'
    }

  }
  stages {    
        stage('Install') {
          steps {
           // sh 'docker build -t front_angular . '
            //sh 'npm cache clean -f '
            sh 'npm install '
          }
        }
     stage ('Build'){
      steps{
        sh 'npm run build --prod '
      }
    }
    stage ('Snar'){
      steps {
        script {
          sh 'npm run sonar '
        }
      }
    }

      }
  
}
