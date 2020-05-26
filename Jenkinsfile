pipeline {
   agent {
       docker {
           image 'python:3.7.7-stretch'
           args '--network=skynet'
       }
   }

   stages {
      stage('Build') {
         steps {
            sh 'pip install robotframework'
            sh 'pip install robotframework-requests'
            sh 'pip install robotframework-jsonlibrary'
            sh 'pip install psycopg2'
            sh 'pip install requests'
         }
      }
      stage('Testing') {
          steps {
            sh 'robot -d ./logs tests/'  
          }
      }
   }
}
