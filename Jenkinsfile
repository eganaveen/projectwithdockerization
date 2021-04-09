pipeline{
  agent any
   stages{
    stage('scm'){
      steps{
        //clone source code from SCM
        git 'https://github.com/eganaveen/projectwithDockerization.git'
      }
    }
     stage('install'){
      steps{
        //test the source code.
        sh 'mvn install'
      }
    } 
     stage('Docker build and tag'){
      steps{
        sh 'docker build -t dockerjenkins":$BUILD_NUMBER" .'
        sh 'docker run -itd --name jd1 -p 8090:8080 dockerjenkins":$BUILD_NUMBER"'
      }
    }
     stage('clean up'){
     steps{
        sh 'docker rmi -f dockerjenkins":$BUILD_NUMBER"'
      }
     }
   }
 }
