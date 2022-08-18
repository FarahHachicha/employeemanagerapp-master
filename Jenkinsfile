pipeline {
     
  agent any
   /* tools {
          nodejs "node"
     }*/
     //{
   /* docker {
      image 'node:16.16.0'
      args '-p 3000:3000'
    }*/

 // }
  
  stages {    
     
        stage('Install') {
            agent {
                  docker {
                       image 'node:16.16.0'
                       args '-p 3000:3000'
                  }
             }
          steps {
           // sh 'docker build -t front_angular . '
            //sh 'npm cache clean -f '
            sh 'npm install '
          }
        }
     stage ('Build'){
            agent {
                  docker {
                       image 'node:16.16.0'
                       args '-p 3000:3000'
                  }
             }
      steps{
        sh 'npm run build --prod '
      }
    }
     /*  stage ('Test'){
            agent {
                  docker {
                       image 'node:16.16.0'
                       args '-p 3000:3000'
                  }
             }
            steps {
             
                 sh 'google-chrome && npm test'
            }
            
       }*/
    stage ('Sonar'){
           agent {
                  docker {
                       image 'node:16.16.0'
                       args '-p 3000:3000'
                  }
             }
        

       environment {scannerHome = tool 'SonarQubeScanner'
                    }
   

      steps {
                        withSonarQubeEnv('SonarQubeFront'){
                         
                          sh '${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=sonar-front'}


      
          //sh 'npm run sonar '
        
      }
    }
   

      }
  
}
