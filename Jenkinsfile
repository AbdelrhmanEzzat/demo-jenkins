pipeline {
  agent any

  environment {
    KUBECONFIG = '/var/lib/jenkins/.kube/config'  // or wherever your config is
  }

  stages {
    stage('Apply K8s Deployment') {
      steps {
        sh 'kubectl apply -f deployment.yaml'
      }
    }

    stage('Check Deployment') {
      steps {
        sh 'kubectl get deployments'
        sh 'kubectl get pods'
      }
    }
  }
}
