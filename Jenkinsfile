pipeline {
  agent any

  stages {
    stage('Apply K8s Deployment') {
      steps {
        script {
          sh 'kubectl apply -f deployment.yaml'
        }
      }
    }

    stage('Check Deployment') {
      steps {
        script {
          sh 'kubectl get deployments'
          sh 'kubectl get pods'
        }
      }
    }
  }
}
