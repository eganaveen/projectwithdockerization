pipeline{
  environment {
    registry = "egadoc/dockerjenkins"
    registryCredential = "egadoc"
  }
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
        sh 'docker build -t registry":$BUILD_NUMBER" .'
        sh 'docker run -itd --name jd1 -p 8090:8080 registry":$BUILD_NUMBER"'
      }
    }
     stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        registry":$BUILD_NUMBER".push() 
                    }
                } 
            }
        } 
    
   }
 }
