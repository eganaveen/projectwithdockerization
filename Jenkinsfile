pipeline{
  agent any
   stages{
    stage('scm'){
      steps{
        //clone source code from SCM
        git 'https://github.com/eganaveen/projectwihtoutDockerization.git'
      }
    }
     stage('install'){
      steps{
        //test the source code.
        sh 'mvn install'
      }
    } 
     stage('ansible'){
       steps{
          //retrieve artifact from nexus and copy to webapss folder in tomcat
         ansiblePlaybook credentialsId: '0f05a22c-09ce-4466-8544-93c91e5a3243', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: 'ansible/vprofile.yml'
       }
     }
   }
 }
