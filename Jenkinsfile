pipeline {
   agent {
       docker {
           image 'qaninja/pyrobot'
           args '--network=skynet'
       }
   }

   stages {
      stage('Testing') {
          steps {
            sh 'robot -d ./logs tests/'
          }
          post {
             always {
               robot 'logs'
             }
          }
      }
      stage('UAT') {
         steps {
            echo 'Simulando a aprovação do PO'
            input(message: 'Você aprova essa versão?', ok: 'Sim :)')
         }
      }
   }
}
