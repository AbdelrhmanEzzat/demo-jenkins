pipeline {
  agent any

  stages {
    stage('Apply K8s Deployment') {
      steps {
        withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
          sh 'sudo kubectl apply -f deployment.yaml'
        }
      }
    }

    stage('Check Deployment') {
      steps {
        withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
          sh 'kubectl get deployments'
          sh 'kubectl get pods'
        }
      }
    }
  }
}
