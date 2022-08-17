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
    stage ('Sonar'){
        

       environment {scannerHome = tool 'SonarQubeScanner'
                    jdk = tool 'java8' }
   

      steps {
                        withSonarQubeEnv('sonarqube'){
                         
                          sh '${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=employeemanager'}


      
          //sh 'npm run sonar '
        
      }
    }

      }
  
}
