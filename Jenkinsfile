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
        sh 'docker tag dockerjenkins":$BUILD_NUMBER" egadoc/dockerjenkins":$BUILD_NUMBER"'
      }
    }
     stage('Deploy our image') { 
            steps { 
                withDockerRegistry([ credentialsId: "docker_creds", url: "" ]) {
                    sh 'docker push egadoc/dockerjenkins":$BUILD_NUMBER"'
              }
            }
        } 
     stage('pull an image from Docker'){
       steps{
          ansiblePlaybook credentialsId: '0f05a22c-09ce-4466-8544-93c91e5a3243', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'projectDocker.yml'
       }
     }
   }
 }
