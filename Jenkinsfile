pipeline {
  agent{
    docker {
      image 'node:16.16.0'
      args '-p 3000:3000'
    }

  }
  tools {
    jdk 'java'
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
    stage ('Sonar'){
       environment {
      
         scannerHome = tool 'SonarQubeScanner'
     }


      steps {
                        withSonarQubeEnv('SonarQubeFront'){
                          sh '${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=sonar-front'}


      
          //sh 'npm run sonar '
        
      }
    }

      }
  
}
