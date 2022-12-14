pipeline {    
  agent any 
  stages {    
        stage('Install') {
            agent {
                  docker {
                       image 'node:16.16.0'
                       args '-p 3000:3000'
                  }
             }
          steps {
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
    stage ('SonarQube analysis'){
           agent {
                  docker {
                       image 'node:16.16.0'
                       args '-p 3000:3000'
                  }
             }
       environment {
            scannerHome = tool 'SonarQubeScanner'
                    }
      steps {
                        withSonarQubeEnv('SonarQubeFront'){
                         
                          sh '${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=sonar-front'}
      }
    }

         stage('Build Docker Image'){
               steps{
                   script {
                       sh 'docker build -t jenkinsfront .'
              }
          }
       }
       stage ('Push Docker Image'){
            steps {
                 script {
                      sh 'docker tag jenkinsfront farahhachicha/jenkinsfront '
                      sh 'docker push farahhachicha/jenkinsfront ' 
                 }
            }
       }
      stage ('Remove Docker Image'){
            steps {
                 script {
                      sh 'docker rmi jenkinsfront ' 
                      sh 'docker rmi farahhachicha/jenkinsfront '
                 }
            }
       }
       stage('Deploy Frontend to kubernetes'){
            steps {
                  script {
                           kubernetesDeploy(configs: "deploy.yaml", kubeconfigId: "kube")
                            }
                 
            }
       }
      }
  
}
